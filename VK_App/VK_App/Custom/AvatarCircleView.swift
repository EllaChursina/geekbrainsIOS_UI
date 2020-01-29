//
//  AvatarCircleView.swift
//  VK_App
//
//  Created by MacBook on 18/08/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class AvatarCircleView: UIView {
    
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height/2
        self.clipsToBounds = true
        self.layer.shadowPath = UIBezierPath(ovalIn: bounds).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
    
    
    
}
