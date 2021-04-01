//
//  GroupsController.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class GroupsController: UITableViewController {
    
    var myGroups = [(name: "Enduro Motorsport", photo: UIImage.init(imageLiteralResourceName: "enduro-motorsport"))]
    
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
        
        cell.groupName.text = myGroup.name
        cell.groupPhoto.image = myGroup.photo

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
             let allGroupsController = segue.source as! AllGroupsController
            
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                
                let group = allGroupsController.allGroups[indexPath.row]
               
                if   (myGroups.firstIndex(where: {$0 != group}) != nil) {
                myGroups.append(group)
                    tableView.reloadData()
                }
            }
        }
        
    }
}


