//
//  HomeViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/27/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class HomeViewController: UIViewController {    
    @IBOutlet weak var logOutButton: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Check User")
        print(Amplify.Auth.getCurrentUser())
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logOutButtonClick(_ sender: Any) {
        
    }
    
    
    

}
