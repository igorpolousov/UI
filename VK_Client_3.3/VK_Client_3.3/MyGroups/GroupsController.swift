//
//  GroupsController.swift
//  VK_Client_3.3
//
//  Created by Igor Polousov on 15.03.2021.
//

import UIKit

class GroupsController: UITableViewController {
    
    var myGroups = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell
        let myGroup = myGroups[indexPath.row]
        cell.groupName.text = myGroup
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             myGroups.remove(at: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
     }
    
    @IBAction func addGroup(segue: UIStoryboardSegue){
        
        if segue.identifier == "addGroup" {
            guard let allGroupsController = segue.source as? AllGroupsController else {return}
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow{
                let group = allGroupsController.allGroups[indexPath.row]
                if !myGroups.contains(group){
                    myGroups.append(group)
                    tableView.reloadData()
                }
            }
        }
        
    }
}
