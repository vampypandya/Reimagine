//
//  SettingUpTwoViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/31/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SettingUpTwoViewController: UIViewController {
    
    @IBOutlet weak var educationallevel: UITextField!
    @IBOutlet weak var major: UITextField!
    @IBOutlet weak var universityname: UITextField!
    
    @IBOutlet weak var secondNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func secondNextClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()
        let education_levelText = Utilities.fieldData(educationallevel)
        let majorText = Utilities.fieldData(major)
        let university_nameText = Utilities.fieldData(universityname)
        
        let educationInfo = UserListerEducationalInfo(id: currentUser!.userId, education: education_levelText, major: majorText, universityname: university_nameText)
        
        Amplify.API.mutate(request: .create(educationInfo)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let educationInfo):
                    print("Successfully created the educational info: \(educationInfo)")
//                    performSegue(withIdentifier: "secondSegue", sender: self.)
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
    

}
