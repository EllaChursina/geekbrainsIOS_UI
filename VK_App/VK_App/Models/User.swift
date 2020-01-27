//
//  User.swift
//  VK_App
//
//  Created by MacBook on 09/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class User {
    let name: String
    let surname: String
    var fullName: String {
        return name + " " + surname
    }
    let avatar: UIImage?
    let photos: [UIImage?]
    
    static func generateUsers() -> [User] {
        
        return [
            User(name: "Саша", surname: "Рубенштейн", avatar: UIImage(named: "2")!, photos: [UIImage(named: "1")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!]),
            User(name: "Дарья", surname: "Петрова", avatar: UIImage(named: "3")!, photos: [UIImage(named: "2c")!, UIImage(named: "3c")!]),
            User(name: "Йося", surname: "Кауфман", avatar: UIImage(named: "4")!, photos: [UIImage(named: "5c")!, UIImage(named: "6c")!]),
            User(name: "Анна", surname: "Степанова", avatar: UIImage(named: "5")!, photos: [UIImage(named: "7c")!]),
            User(name: "Мария", surname: "Кац", avatar: UIImage(named: "6")!, photos: [UIImage(named: "2c")!, UIImage(named: "5c")!, UIImage(named: "8c")!]),
            User(name: "Иван", surname: "Сидоров", avatar: UIImage(named: "7")!, photos: [UIImage(named: "10")!, UIImage(named: "9c")!, UIImage(named: "11")!, UIImage(named: "4c")!]),
            User(name: "Моше", surname: "Коэн", avatar: UIImage(named: "8")!, photos: [UIImage(named: "9")!, UIImage(named: "5c")!, UIImage(named: "10c")!, UIImage(named: "7c")!])
        ]
    }
    
        
        

    
    init(name: String, surname: String, avatar: UIImage?, photos: [UIImage?]){
        self.name = name
        self.surname = surname
        self.avatar = avatar
        self.photos = photos
    }
}
