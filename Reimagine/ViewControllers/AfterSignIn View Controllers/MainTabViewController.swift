//
//  MainTabViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/28/20.
//

import UIKit
import Amplify
import AmplifyPlugins



class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUser = Amplify.Auth.getCurrentUser()
        let userItem = UserLister(userId:currentUser!.userId, userName:currentUser!.username)
        self.addUser(userItem)
        // Do any additional setup after loading the view.
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
