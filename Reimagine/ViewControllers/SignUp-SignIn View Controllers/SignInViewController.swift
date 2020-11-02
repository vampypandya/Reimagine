//
//  SignInViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/28/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SignInViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
        

        // Do any additional setup after loading the view.
    }
    
    func customizeElements() {
        errorLabel.alpha = 0
        // Style Elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signInButton)
    }
    
    @IBAction func signInButtonClick(_ sender: Any) {
        let emailText = Utilities.fieldData(emailTextField)
        let passwordText = Utilities.fieldData(passwordTextField)
        
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
        
    }
    
    func loadHomeScreen(){
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyBoard.instantiateViewController(identifier: "MainTabViewController") as? MainTabViewController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()

        }
    }
    

}
