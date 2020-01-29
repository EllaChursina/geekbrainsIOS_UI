//
//  DotLoaderView.swift
//  VK_App
//
//  Created by Элла Чурсина on 14.01.2020.
//  Copyright © 2020 EllaChursina. All rights reserved.
//

import UIKit

class DotLoaderView: UIView {
    
    
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    

}
