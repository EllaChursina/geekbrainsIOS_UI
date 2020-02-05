//
//  AllGroupsController.swift
//  VK_App
//
//  Created by MacBook on 09/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController {

    var allCommunities = [
        Community(name: "Метро Петербурга", avatar: UIImage(named: "metro")!),
        Community(name: "Искусство", avatar: UIImage(named: "art")!),
        Community(name: "Новая визуальная культура", avatar: UIImage(named: "newvisualculture")!),
        Community(name: "Кровосток", avatar: UIImage(named: "krovostock")!),
        Community(name: "Батенька, да вы трансформер", avatar: UIImage(named: "batenka")!),
        Community(name: "Ботанический сад", avatar: UIImage(named: "botanicgarden")!)
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allCommunities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllCommunitiesCell", for: indexPath) as?
            CommunitiesCell else { fatalError("Cell cannot be dequeued")}
        
        let someCommunity = allCommunities[indexPath.row].name
        let someAvatar = allCommunities[indexPath.row].avatar
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        cell.allNameCommunities.text = someCommunity
        cell.allAvatarCommunities.image = someAvatar
        cell.allAvatarCommunitiesView.tag = indexPath.row
        cell.allAvatarCommunitiesView.isUserInteractionEnabled = true
        cell.allAvatarCommunitiesView.addGestureRecognizer(tapGestureRecognizer)
        return cell
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
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

}
