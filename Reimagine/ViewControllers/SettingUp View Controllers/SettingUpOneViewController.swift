//
//  SettingUpOneViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/31/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SettingUpOneViewController: UIViewController {
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var city_state: UITextField!
    @IBOutlet weak var country: UITextField!
    
    
    @IBOutlet weak var firstNext: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func firstNextClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()
        
        let fnameText = Utilities.fieldData(fname)
        let lnameText = Utilities.fieldData(lname)
        let nicknameText = Utilities.fieldData(nickname)
        let emailText = Utilities.fieldData(email)
        let city_stateText = Utilities.fieldData(city_state)
        let countryText = Utilities.fieldData(country)
        
        let personalInfo = UserListerPersonalInfo(id: currentUser!.userId,  fname: fnameText, lname: lnameText, email: emailText, nickname: nicknameText, city_state: city_stateText, country: countryText)
        
        Amplify.API.mutate(request: .create(personalInfo)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let personalInfo):
                    print("Successfully created the personal info: \(personalInfo)")
//                    performSegue(withIdentifier: "firstSegue", sender: self)
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
}
