//
//  FriendsController.swift
//  VK_Client_3.4
//
//  Created by Igor Polousov on 21.03.2021.
//

import UIKit

class FriendsController: UITableViewController {

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        let friend = friends[indexPath.row]
        
        cell.friendName.text = friend.name
        cell.friendImage.image = friend.photo
    
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Задали название контроллера куда будет пердаваться иформация
        let vc = segue.destination as! FriendsPhotoController
        // Задали название переменной в которой будет содержаться индекс выбюранной строки таблицы. 
        let index = tableView.indexPathForSelectedRow?.row
        // Pass the selected object to the new view controller.
        
        vc.friendPhoto = friends[index!]
    }
    

}
