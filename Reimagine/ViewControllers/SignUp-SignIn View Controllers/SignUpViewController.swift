//
//  SignUpViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/27/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SignUpViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var signUpStack: UIStackView!
    @IBOutlet weak var verificationCodeTextField: UITextField!
    
    @IBOutlet weak var getVerifiedButton: UIButton!
    
    @IBOutlet weak var verificationErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
        // Do any additional setup after loading the view.
    }
    
    // Show error Message
        func showErrorMessage(_ error:String) {
            errorLabel.alpha = 1
            errorLabel.text = error
        }
    
    func customizeElements() {
  
        errorLabel.alpha = 0
        
        
        // Style Elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(birthdayTextField)
        
        // Style Verification Elements
        
        Utilities.styleFilledButton(getStartedButton)
        Utilities.styleTextField(verificationCodeTextField)
        Utilities.styleFilledButton(getVerifiedButton)
        getVerifiedButton.alpha = 0
        verificationCodeTextField.alpha = 0
        verificationErrorLabel.alpha = 0
    }

    @IBAction func getStartedButtonClick(_ sender: Any) {
                print("Button Clicked")
        // Validate Fields
                let error = Utilities.validateFields([firstNameTextField,lastNameTextField,emailTextField,passwordTextField,birthdayTextField])

               
                if error != nil {
        // Issue with the fields, show error label
                    showErrorMessage(error!)
                }
                else{
        // Get Field Data
                    let fname = Utilities.fieldData(firstNameTextField)
                    let lname = Utilities.fieldData(lastNameTextField)
                    let emailText = Utilities.fieldData(emailTextField)
                    let passwordText = Utilities.fieldData(passwordTextField)
//                    let birthdayText = Utilities.fieldData(birthdayTextField)
                    print("Now going to Sign Up !!")
                    signUp(fname, lname, passwordText, emailText)
                    
                }
    }
    
    func signUp(_ firstName: String, _ lastName: String, _ password: String, _ email: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email), AuthUserAttribute(.givenName, value: firstName), AuthUserAttribute(.familyName, value: lastName) ]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        print("Trying Sign Up !!")
        Amplify.Auth.signUp(username: email, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    self.confirmSignUp(email)
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
            }
        }
    }
    
    func confirmSignUp(_ username: String) {
        DispatchQueue.main.async {
            // Disable above fields
            self.firstNameTextField.isEnabled = false
            self.lastNameTextField.isEnabled = false
            self.birthdayTextField.isEnabled = false
            self.passwordTextField.isEnabled = false
            self.emailTextField.isEnabled = false
            
            // Enable Current fields
            self.getVerifiedButton.alpha = 1
            self.verificationCodeTextField.alpha = 1
            
            self.signUpStack.alpha = 0
            self.getStartedButton.alpha = 0
        }  
    }
    
    
    @IBAction func getVerifiedButton(_ sender: Any) {
        let verficationCode = Utilities.fieldData(verificationCodeTextField)
        let emailText = Utilities.fieldData(emailTextField)
        let passwordText = Utilities.fieldData(passwordTextField)
        Amplify.Auth.confirmSignUp(for: emailText, confirmationCode: verficationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
                Amplify.Auth.signIn(username: emailText, password: passwordText) { result in
                    switch result {
                    case .success:
                        self.loadHomeScreen()
                    case .failure(let error):
                        print("Sign in error \(error)")
                        DispatchQueue.main.async {
                            self.errorLabel.alpha = 1
                            self.errorLabel.text = error.debugDescription
                        }
                    }
                }
//                self.loadHomeScreen(emailText, passwordTextField)
            case .failure(let error):
                DispatchQueue.main.async {
                self.verificationErrorLabel.alpha = 1
                    self.verificationErrorLabel.text = error.errorDescription
                }
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
    
    func loadHomeScreen(){
        let storyBoard = UIStoryboard(name: "SettingUp", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyBoard.instantiateViewController(identifier: "SettingUpOneViewController") as? SettingUpOneViewController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
        }
    }
    func addUser(_ userItem:UserLister){
        Amplify.API.mutate(request: .create(userItem)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let userItem):
                    print("Successfully created the todo: \(userItem)")
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
    
    
    
    

}
