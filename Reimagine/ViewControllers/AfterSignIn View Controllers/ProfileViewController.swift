//
//  ProfileViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/30/20.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableDisplayView: UITableView!
    @IBOutlet weak var updateInfoButton: UIButton!
    @IBOutlet weak var updateInfoButtonHeight: NSLayoutConstraint!
    
    enum TextFieldData: Int {
        case nickname
        case birthdate
        case address
        case organizationname
        case city_state
        case country
        case education
        case major
        case universityname
        case graduation
        case dreamcity
        case dreamactivity
        case dreamcelebrity
    }
    
    let textFieldIdentifiers = [
        ["nickname","birthdate","address","organizationname","city_state","country"],["education","major","universityname","graduation"],
                                ["dreamcity","dreamactivity","dreamcelebrity"]
    ]
    
    let tags = [[100,101,102,103,104,105],[106,107,108,109],[110,111,112]]
    
    var textFieldValues = [[String]]()
    
    let personalInformationArray = [
        ["Enter Nickname", "BirthDate", "Enter Full Address", "Enter Organization Name", "Enter City, State","Enter Country"],
        ["Education Level","Major","University Name","Graduation Month/Year"],
        ["Dream City to visit", "Dream Activity to do", "Dream celebrity to date"]
    ]
    let sectionHeader = ["Personal Information", "Educational Information", "Dream"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDisplayView.delegate = self
        tableDisplayView.dataSource = self
        Utilities.styleFilledButton(updateInfoButton)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return personalInformationArray.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0, y:0, width:348, height:60))
        label.text = sectionHeader[section]
//        label.backgroundColor = UIColor.systemGreen
        return label

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personalInformationArray[section].count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath)
        // Configure the cell...
        if let label = cell.viewWithTag(100) as? UITextField {
            label.placeholder = personalInformationArray[indexPath.section][indexPath.row]
            label.borderStyle = .none
//            label.tag =
            label.tag = tags[indexPath.section][indexPath.row]
            print(indexPath.section,indexPath.row)
//            print(indexPath.row)
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: label.frame.height - 2, width: label.frame.width-25, height: 2)
            bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
            label.layer.addSublayer(bottomLine)
//            Utilities.styleTextField(label)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //Display button programatically
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.section + 1 == personalInformationArray.count {
//            Utilities.styleFilledButton(updateInfoButton)
//            updateInfoButton.setTitle("Update information", for: .normal)
//            updateInfoButtonHeight.constant = 60
//        }
//        else{
//            updateInfoButton.setTitle("", for: .normal)
//            updateInfoButtonHeight.constant = 0
//        }
//
//
//    }
    
//    func tableV
    
    
    // MARK: - Program to add info in Database on button click
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//        var cell = tableView.cellForRow(at: indexPath)! as UITableViewCell
//        cell.tag = tags[indexPath.section][indexPath.row]
    }

    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        let cell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        if let field = cell.viewWithTag(tags[indexPath!.section][indexPath!.row]) as? UITextField {
            textFieldValues[indexPath!.section][indexPath!.row] = field.text!
            print(field.text!)
        }
        
    }
    
    // TODO: - Add this
    @IBAction func updateInfo(_ sender: Any) {
//        for section in 0..<personalInformationArray.count {
//            for row in 0..<personalInformationArray[section].count {
//                let indexPath = IndexPath(row: row, section: section)
//                print(indexPath)
////                tableDisplayView.cellForRow(at: <#T##IndexPath#>)
//                if let currentCell = tableDisplayView.cellForRow(at: indexPath) {
//                    print(currentCell)
//    //                let label = currentCell.viewWithTag()
//                    if let label = currentCell.viewWithTag(tags[section][row]) as? UITextField {
//                        textFieldValues[section][row] = label.text!
//                    }
//                }
//            }
//        }
//
//        print(textFieldValues)
        print(textFieldValues)

    }
}
