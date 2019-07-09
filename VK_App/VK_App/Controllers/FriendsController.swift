//
//  FriendsController.swift
//  VK_App
//
//  Created by MacBook on 08/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    var users = [
        User(name: "Саша Рубенштейн", avatar: UIImage(named: "2")!, id: 0, photos: [UIImage(named: "1")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!]),
        User(name: "Дарья Петрова", avatar: UIImage(named: "3")!, id: 1, photos: [UIImage(named: "2c")!, UIImage(named: "3c")!]),
        User(name: "Йося Кауфман", avatar: UIImage(named: "4")!, id: 2, photos: [UIImage(named: "5c")!, UIImage(named: "6c")!]),
        User(name: "Анна Степанова", avatar: UIImage(named: "5")!, id: 3, photos: [UIImage(named: "7c")!]),
        User(name: "Мария Кац", avatar: UIImage(named: "6")!, id: 4, photos: [UIImage(named: "2c")!, UIImage(named: "5c")!, UIImage(named: "8c")!]),
        User(name: "Иван Сидоров", avatar: UIImage(named: "7")!, id: 5, photos: [UIImage(named: "10")!, UIImage(named: "9c")!, UIImage(named: "11")!, UIImage(named: "4c")!]),
        User(name: "Моше Коэн", avatar: UIImage(named: "8")!, id: 6, photos: [UIImage(named: "9")!, UIImage(named: "5c")!, UIImage(named: "10c")!, UIImage(named: "7c")!])
        
    ]

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as?
            AllFriendsCell else { fatalError("Friend Cell cannot be dequeued")}
        
        let friend = users[indexPath.row].name
        let friendAvatar = users[indexPath.row].avatar
        
        cell.friendName.text = friend
        cell.avatarView.image = friendAvatar

        return cell
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
