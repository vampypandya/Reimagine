//
//  SearchViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/30/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var displayTableView: UITableView!
    
    var userAccounts = [UserLister]()
    var searchUser = [UserLister]()
    var searching = false
    
//    var trialUserAccount = ["Aa","Bb","Cc","Ac","Ab"]
//    var trialSearchUser = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let fetchContactGrp = DispatchGroup()
//        fetchContactGrp.enter()
//        getUsernameList(){ bucketlists in
//            for bucketlist in bucketlists {
//                self.userAccounts.append(bucketlist)
//            }
//            fetchContactGrp.leave()
//        }
//        fetchContactGrp.wait()

        // Do any additional setup after loading the view.
    }
    

    func getUsernameList(callBack: @escaping ([UserLister]) -> Void){
            let userId = Amplify.Auth.getCurrentUser()!.userId
            let bucketItems = UserLister.keys
        Amplify.API.query(request: .list(UserLister.self, where: bucketItems.id != userId)) { event in
                switch event {
                case .success(let result):
                    switch result{
                    case .success(let posts):
                        callBack(posts)
                    case .failure(let error):
                        print("\(error)")
                    }
                case .failure(let error):
                    print("Got failed event with error \(error)")
                }
                    
            }
        }
    
    
    // MARK: - Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchUser.count
        }
        return userAccounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = displayTableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
        cell.frame = CGRect(x:50, y:70*indexPath.row, width:361, height:70)

        if searching {
            if let label = cell.viewWithTag(100) as? UIButton {
                label.setTitle(searchUser[indexPath.row].id, for: .normal)
                label.frame = CGRect(x:0, y:0, width:311, height:50)
                Utilities.styleFilledButton(label)
            }
        }
        else {
            if let label = cell.viewWithTag(100) as? UIButton {
                label.setTitle(userAccounts[indexPath.row].id, for: .normal)
                label.frame = CGRect(x:0, y:0, width:311, height:50)
                Utilities.styleFilledButton(label)
            }
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchUser = userAccounts.filter({$0.id.prefix(searchText.count) == searchText})
        searching = true
        displayTableView.reloadData()
    }
}
