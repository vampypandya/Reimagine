//
//  ProfileTableViewController.swift
//  Reimagine
//
//  Created by Vishwam Pandya on 10/30/20.
//

import UIKit




class ProfileTableViewController: UITableViewController {

    let personalInformationArray = [
        ["Enter Nickname", "BirthDate", "Enter Full Address", "Enter Organization Name", "Enter City, State","Enter Country"],
        ["Education Level","Major","University Name","Graduation Month/Year"],
        ["Dream City to visit", "Dream Activity to do", "Dream celebrity to date","xxx"]
    ]
    let sectionHeader = ["Personal Information", "Educational Information", "Dream"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return personalInformationArray.count
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0, y:0, width:348, height:60))
        label.text = sectionHeader[section]
//        label.backgroundColor = UIColor.systemGreen
        return label

    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personalInformationArray[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath)
        // Configure the cell...
        if let label = cell.viewWithTag(100) as? UITextField {
            label.placeholder = personalInformationArray[indexPath.section][indexPath.row]
            label.borderStyle = .none
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: label.frame.height - 2, width: label.frame.width-25, height: 2)
            bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
            label.layer.addSublayer(bottomLine)
//            Utilities.styleTextField(label)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView()
        var button  = UIButton()
        button.frame = CGRect(x: 20, y: 10, width: 300, height: 50)
           button.setTitle("CustomButton", for: .normal)
        button.setTitleColor( UIColor.red, for: .normal)
        button.backgroundColor = UIColor.red
        view.addSubview(button)
        return view
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
