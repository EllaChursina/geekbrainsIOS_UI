//
//  AvatarCircleView.swift
//  VK_App
//
//  Created by MacBook on 18/08/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

@IBDesignable class AvatarCircleView: UIImageView {

    @IBInspectable var shadowRadius: CGFloat = 10.0{
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var shadowColor: UIColor = .black{
        didSet {
            setNeedsDisplay()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    override func layoutSubviews() {
        guard let contents = self.layer.contents else {return}
        self.layer.contents = nil
        let borderLayer = CAShapeLayer()
        borderLayer.contents = contents
        let borderFrame = CGRect(x: 0, y: 0, width: bounds.width - 5, height: bounds.height - 5)
        borderLayer.frame = borderFrame
        borderLayer.masksToBounds = true
        borderLayer.cornerRadius = bounds.width/2 - 2.5
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(ovalIn: bounds).cgPath
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        shadowLayer.shadowOpacity = 0.2
        shadowLayer.shadowRadius = 1.5
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(shadowLayer)
        self.layer.addSublayer(borderLayer)
        
        
    }
}
