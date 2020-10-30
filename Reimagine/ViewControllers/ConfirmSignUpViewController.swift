//
//  ConfirmSignUpViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/28/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class ConfirmSignUpViewController: UIViewController {

    var username: String?
    
    @IBOutlet weak var verificationCodeTextField: UITextField!
    
    @IBOutlet weak var confirmSignUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    init(username: String, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        self.username = username
        super.init(nibName:nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
        // Do any additional setup after loading the view.
    }
    
    func customizeElements() {
  
        errorLabel.alpha = 0
        // Style Elements
        Utilities.styleTextField(verificationCodeTextField)
        Utilities.styleFilledButton(confirmSignUpButton)
    }
    
    // Show error Message
    func showErrorMessage(_ error:String) {
            errorLabel.alpha = 1
            errorLabel.text = error
        }
    
    @IBAction func confirmSignUpButton(_ sender: Any) {
        let confirmationCode = Utilities.fieldData(verificationCodeTextField)

    }
    
}
