//
//  AddItemViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/28/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class AddItemViewController: UIViewController {

    @IBOutlet weak var labelField: UILabel!
    @IBOutlet weak var activityNameTextField: UITextField!
    
    @IBOutlet weak var activityTypeTextField: UITextField!
    
    @IBOutlet weak var activityDescriptionTextField: UITextView!
    
    @IBOutlet weak var addItemButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeElements()
        // Do any additional setup after loading the view.
         }
    
    func customizeElements() {
        labelField.alpha = 0
        // Style Elements
        Utilities.styleTextField(activityNameTextField)
        Utilities.styleTextField(activityTypeTextField)
        
    }
    
    @IBAction func addItemButtonClick(_ sender: Any) {

        let currentUser = Amplify.Auth.getCurrentUser()
        
        let userId = currentUser!.userId
        let activityNameText = Utilities.fieldData(activityNameTextField)
        let activityTypeText = Utilities.fieldData(activityTypeTextField)
        let activityDescriptionText = activityDescriptionTextField.text
        let bucketListItem = BucketLister(title:activityNameText, type:activityTypeText, description: activityDescriptionText!,userId:userId )
        self.addItemInBucket(bucketListItem, userId)
        let newPost = PostLister(postId:"0",content:activityDescriptionText!, likes:0, userId:userId)
        self.addPost(newPost, userId)
        
        labelField.alpha = 1
        labelField.text = "Your dream added"
        
        
        
    }
    
    func addItemInBucket(_ bucketListItem : BucketLister, _ userId: String){
        Amplify.API.mutate(request: .create(bucketListItem)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let bucketListItem):
                    print("Successfully created the todo: \(bucketListItem)")
                    let bucketId = bucketListItem.id
                    let bucket2user = UserIdToBucketId(userId:userId, bucketId:bucketId)
                    self.addBucketIdtoUserId(bucket2user)
                    
                    
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to create a todo", apiError)
            }
        }
    }
    
    func addBucketIdtoUserId(_ bucket2user : UserIdToBucketId) {
        Amplify.API.mutate(request: .create(bucket2user)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let bucket2user):
                    print("Successfully attached the buckt to user: \(bucket2user)")

                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to attach", apiError)
            }
        }
    }
    
    func addPost(_ newPost: PostLister, _ userId:String){
        Amplify.API.mutate(request: .create(newPost)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let newPost):
                    print("Successfully attached the buckt to user: \(newPost)")
                    let postId = newPost.id
                    let user2post = UserIdToPostId(userId:userId, postId:postId)
                    self.addUserIdToPostId(user2post)

                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to attach", apiError)
            }
        }
    }
    
    func addUserIdToPostId(_ user2post: UserIdToPostId) {
        Amplify.API.mutate(request: .create(user2post)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let user2post):
                    print("Successfully attached the buckt to user: \(user2post)")
                case .failure(let graphQLError):
                    print("Failed to create graphql \(graphQLError)")
                }
            case .failure(let apiError):
                print("Failed to attach", apiError)
            }
        }
    }
    
}
