//
//  LogOutViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/28/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                self.goToLoginPage()
            case .failure(let error):
                print("LogOut Error\(error)")
            
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    func goToLoginPage() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        DispatchQueue.main.async {
            let vc = storyBoard.instantiateViewController(identifier: "ViewController") as? ViewController
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
