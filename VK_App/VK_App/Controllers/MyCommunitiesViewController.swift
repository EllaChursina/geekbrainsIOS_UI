//
//  MyCommunitiesViewController.swift
//  VK_App
//
//  Created by MacBook on 09/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class MyCommunitiesViewController: UITableViewController {

    var myCommunities = [
        Community(name: "Привет! Как дела?", avatar: UIImage(named: "privet")!),
        Community(name: "Geekbrains", avatar: UIImage(named: "geekbrains")!),
        Community(name: "Намочи манту", avatar: UIImage(named: "namochi")!),
        Community(name: "Лентач", avatar: UIImage(named: "lentach")!),
        Community(name: "Женская власть", avatar: UIImage(named: "femalepower")!),
        Community(name: "Русский шаффл", avatar: UIImage(named: "russiansuffle")!)
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

  

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myCommunities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCommunitiesCell", for: indexPath) as?
            CommunitiesCell else { fatalError("Cell cannot be dequeued")}
        
        let someCommunity = myCommunities[indexPath.row].name
        let someAvatar = myCommunities[indexPath.row].avatar
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        cell.nameCommunities.text = someCommunity
        cell.avatarCommunities.image = someAvatar
        cell.avatarCommunitiesView.tag = indexPath.row
        cell.avatarCommunitiesView.isUserInteractionEnabled = true
        cell.avatarCommunitiesView.addGestureRecognizer(tapGestureRecognizer)
        
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
