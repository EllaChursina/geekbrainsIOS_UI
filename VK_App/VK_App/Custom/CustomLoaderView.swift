//
//  CustomLoaderView.swift
//  VK_App
//
//  Created by Элла Чурсина on 14.01.2020.
//  Copyright © 2020 EllaChursina. All rights reserved.
//

import UIKit

class CustomLoaderView: UIView {
    
    static let instance : CustomLoaderView = {
        let customLoader = CustomLoaderView(frame: UIScreen.main.bounds)
        customLoader.isUserInteractionEnabled = true
        return customLoader
    }()
    
    let dotLoader1 = DotLoaderView()
    let dotLoader2 = DotLoaderView()
    let dotLoader3 = DotLoaderView()
     
     lazy var stackView : UIStackView = {
         let sv = UIStackView(arrangedSubviews: [dotLoader1, dotLoader2, dotLoader3])
         sv.translatesAutoresizingMaskIntoConstraints = false
         sv.axis = .horizontal
         sv.spacing = 10
         sv.distribution = .fillEqually
         return sv
     }()
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: UIScreen.main.bounds)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        transparentView.isUserInteractionEnabled = true
        return transparentView
    }()
    
    lazy var tapGestureRecognizer : UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideMyLoader))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
    
    func showLoader() {
        self.addSubview(transparentView)
        transparentView.addSubview(stackView)
        UIApplication.shared.keyWindow?.addSubview(self)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 20),
            stackView.widthAnchor.constraint(equalToConstant: 80)
        ])
        self.layoutIfNeeded()
        firstDotAnimation()
        self.layoutIfNeeded()
        secondDotAnimation()
        self.layoutIfNeeded()
        thirdDotAnimation()
        
        
        
    }
    
    @objc func hideMyLoader(){
             print("hide")
             self.transparentView.removeFromSuperview()
             self.stackView.removeFromSuperview()
             self.removeFromSuperview()
         }
    
    func firstDotAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.dotLoader1.alpha = 0
        }) { (true) in
            
            self.secondDotAnimation()
        }
    }
    
    func secondDotAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0.35, options: [.autoreverse, .repeat], animations: {
               self.dotLoader2.alpha = 0
           }) { (true) in
            self.thirdDotAnimation()
           }
       }
    
    func thirdDotAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0.7, options: [.autoreverse, .repeat], animations: {
               self.dotLoader3.alpha = 0
           }) { (true) in
            
           }
       }
   
    /*func hideLoader() {
        self.transparentView.removeFromSuperview()
        self.stackView.removeFromSuperview()
        
    }*/
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        transparentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
