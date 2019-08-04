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
        Community(name: "Метро Петербурга", avatar: nil),
        Community(name: "Искусство", avatar: nil),
        Community(name: "Новая визуальная культура", avatar: nil),
        Community(name: "Кровосток", avatar: nil),
        Community(name: "Батенька, да вы трансформер", avatar: nil),
        Community(name: "Ботанический сад", avatar: nil)
        
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
        
        
        cell.allNameCommunities.text = someCommunity
        
        
        return cell
    }

}
