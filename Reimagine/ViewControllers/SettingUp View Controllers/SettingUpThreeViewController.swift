//
//  SettingUpThreeViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/31/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SettingUpThreeViewController: UIViewController {

    @IBOutlet weak var sport: UITextField!
    
    @IBOutlet weak var hobby: UITextField!
    @IBOutlet weak var dreamcity: UITextField!
    @IBOutlet weak var celebrity: UITextField!
    @IBOutlet weak var dream: UITextField!
    @IBOutlet weak var car: UITextField!
    
    @IBOutlet weak var thirdNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func thirdNextClick(_ sender: Any) {
        let currentUser = Amplify.Auth.getCurrentUser()
        let dreamcityText = Utilities.fieldData(dreamcity)
        let hobbyText = Utilities.fieldData(hobby)
        let sportText = Utilities.fieldData(sport)
        let celebrityText = Utilities.fieldData(celebrity)
        let carText = Utilities.fieldData(car)
        let unachievabledreamText = Utilities.fieldData(dream)
        
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
