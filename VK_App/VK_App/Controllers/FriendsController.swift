//
//  FriendsController.swift
//  VK_App
//
//  Created by MacBook on 08/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    let users = User.generateUsers()
    var usersDictionary = [String: [User]]()
    var userSectionTitles = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for user in users {
            let userKey = String(user.surname.prefix(1))
            if var userValue = usersDictionary[userKey] {
                userValue.append(user)
                usersDictionary[userKey] = userValue
            } else {
                usersDictionary[userKey] = [user]
            }
        }
        userSectionTitles = [String](usersDictionary.keys)
        userSectionTitles = userSectionTitles.sorted(by: { $0 < $1 })
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return userSectionTitles.count
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let userKey = userSectionTitles[section]
        if let userValue = usersDictionary[userKey] {
            return userValue.count
        }
        return 0
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as?
            AllFriendsCell else { fatalError("Friend Cell cannot be dequeued")}
        let userKey = userSectionTitles[indexPath.section]
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
               tapGestureRecognizer.numberOfTouchesRequired = 1
        if let dictionaryByKey = usersDictionary[userKey] {
            let user = dictionaryByKey[indexPath.row]
            cell.friendName.text = user.fullName
            cell.circleAvatarImageView.image = user.avatar
            cell.avatarView.tag = indexPath.row
            cell.avatarView.isUserInteractionEnabled = true
            cell.avatarView.addGestureRecognizer(tapGestureRecognizer)
        } else {
            print("Error")
        }
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let avatarView = tapGestureRecognizer.view! as! AvatarCircleView
        print("your taped image view tag is: \(avatarView.tag) ")
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [],
                       animations: {
                        avatarView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                        
        }) { (true) in
            UIView.animate(withDuration: 0.25,
                                  delay: 0,
                                  usingSpringWithDamping: 0.5,
                                  initialSpringVelocity: 0,
                                  options: [],
                                  animations: {
                                   avatarView.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return userSectionTitles
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendsPhotoSegue",
            let indexPath = tableView.indexPathForSelectedRow,
        let photoVC = segue.destination as? FriendsPhotoController{
            let friend = users[indexPath.row]
            let photos = friend.photos as! [UIImage]
            
            photoVC.photos = photos
            
        }
    }

}
