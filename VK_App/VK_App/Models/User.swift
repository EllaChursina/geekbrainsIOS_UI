//
//  User.swift
//  VK_App
//
//  Created by MacBook on 09/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class User{
    let name: String
    let avatar: UIImage?
    let id: Int
    let photos: [UIImage?]
    init(name: String, avatar: UIImage?, id: Int, photos: [UIImage?]){
        self.name = name
        self.avatar = avatar
        self.id = id
        self.photos = photos
    }
}
