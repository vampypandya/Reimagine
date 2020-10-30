//
//  ViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        customizeElements()
        // Do any additional setup after loading the view.
    }
    
    func customizeElements() {
        // Style Elements
        Utilities.styleHollowButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
    }

    @IBAction func logInButtonClick(_ sender: Any) {
    }
    
    @IBAction func signUpButtonClick(_ sender: Any) {
    }
}

/*
 
 Tasks:
 1. Login / Signup
 2. See Home Page Suggestions of other users whom we follow
 3. Add New item in Bucket List
 4. Follow other people
 5. Message other people
 6. Get Suggestions for other tasks
 
 Component Designs:
 POSTS_STORED_PER_USER: 200
 Store feed for all users in memory with timely backend update rather than on load update
 Keep LRU Cache for storing feed of users
 Have Pull to Request model
 Use Amazon S3
 
 User Class:
 1. First Name
 2. Last Name
 3. Gender
 4. Address
 5. Email Id
 6. Phone Number
 7. Birthday
 8. Interests
 9. Bucket List
 10. Photos
 11. User Id
 12. Creation Date
 13. Last Login
 14. Social Networks
 
 User Follow Class:
 1. User Id
 2. Friend Id
 
 Bucket List Class:
 1. Bucket Id
 2. Name of activity
 3. Tags (Need to get from description)
 4. Description (Optional)
 
 Bucket Follow Class:
 1. User Id
 2. Bucket Id
 
 Post Class:
 1. Post Id
 2. User Id
 3. Page Id (TODO)
 4. Contents
 
 Post Media Class:
 1. Post Id
 2. Media Id
 
 Media Class:
 1. Media Id
 2. Type
 3. Creation Date
 4. Path
 
 APIs
 1. getUserFeed(userId, count)
 
 
 
 */



