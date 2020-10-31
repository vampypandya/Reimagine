//
//  DsiplayBucketListsViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/29/20.
//

import UIKit
import Amplify
import AmplifyPlugins

class DsiplayBucketListsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    var titleList = [String]()
    
    var optionList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchContactGrp = DispatchGroup()
        fetchContactGrp.enter()
        getOptionList(){ bucketlists in
            for bucketlist in bucketlists {
                let title = bucketlist.title
                print(title)
                self.titleList.append(title)
            }
            fetchContactGrp.leave()
        }
        fetchContactGrp.wait()
        
        
        print(self.titleList)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func getOptionList(callBack: @escaping ([BucketLister]) -> Void){
//            var sortedPosts = [String]()
            
            let userId = Amplify.Auth.getCurrentUser()!.userId
            let bucketItems = BucketLister.keys
                Amplify.API.query(request: .list(BucketLister.self, where: bucketItems.userId==userId)) { event in
                switch event {
                case .success(let result):
                    switch result{
                    case .success(let posts):
//                                return posts
//                                for item in posts{
//                                    sortedPosts.append(item.title)
//                                }
                        callBack(posts)
//                                print(sortedPosts)
                    case .failure(let error):
                        print("\(error)")
//                                return [error]
                    }
                    
                    
                case .failure(let error):
                    print("Got failed event with error \(error)")
                }
                    
            }
//        print(sortedPosts)
//        return sortedPosts
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(titleList.count)
        print(self.titleList)
        return self.titleList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            // 1
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        print(self.titleList)
        
        cell.frame = CGRect(x:50, y:70*indexPath.row, width:361, height:70)
        print(CGRect(x:50, y:70*indexPath.row, width:361, height:50))
        if let label = cell.viewWithTag(100) as? UIButton {
            label.setTitle(self.titleList[indexPath.row], for: .normal)
            label.frame = CGRect(x:0, y:0, width:311, height:50)
            Utilities.styleFilledButton(label)
        }
    
        return cell
    }

}
