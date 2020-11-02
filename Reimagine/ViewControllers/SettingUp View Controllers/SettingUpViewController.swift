//
//  SettingUpViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/31/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SettingUpViewController: UIViewController {

    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var city_state: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var education_level: UITextField!
    @IBOutlet weak var major: UITextField!
    @IBOutlet weak var university_name: UITextField!
    @IBOutlet weak var dreamcity: UITextField!
    @IBOutlet weak var hobby: UITextField!
    @IBOutlet weak var sport: UITextField!
    @IBOutlet weak var celebrity: UITextField!
    @IBOutlet weak var car: UITextField!
    @IBOutlet weak var unachievabledream: UITextField!
    @IBOutlet weak var homeButton: UIButton!
    
    
    @IBOutlet weak var firstNext: UIButton!
    @IBOutlet weak var secondNext: UIButton!
    @IBOutlet weak var thirdNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func homeButtonClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()

        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyBoard.instantiateViewController(identifier: "MainTabViewController") as? MainTabViewController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
        }
        
        
        
    }
    
    @IBAction func firstButtonClick(_ sender: Any) {
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
    
    @IBAction func secondButtonClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()
        let education_levelText = Utilities.fieldData(education_level)
        let majorText = Utilities.fieldData(major)
        let university_nameText = Utilities.fieldData(university_name)
        
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
    
    @IBAction func thirdButtonClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()
        let dreamcityText = Utilities.fieldData(dreamcity)
        let hobbyText = Utilities.fieldData(hobby)
        let sportText = Utilities.fieldData(sport)
        let celebrityText = Utilities.fieldData(celebrity)
        let carText = Utilities.fieldData(car)
        let unachievabledreamText = Utilities.fieldData(unachievabledream)
        
        let dreamInfo = UserListerDreamInfo(id: currentUser!.userId, dreamcity: dreamcityText, dreamactivity: hobbyText, dreamcelebrity: celebrityText)
        
        Amplify.API.mutate(request: .create(dreamInfo)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let dreamInfo):
                    print("Successfully created the dream info: \(dreamInfo)")
//                    performSegue(withIdentifier: "thirdSegue", sender: self)
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
}
