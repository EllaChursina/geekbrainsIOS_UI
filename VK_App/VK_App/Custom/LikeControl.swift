//
//  LikeControl.swift
//  VK_App
//
//  Created by MacBook on 21/08/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

@IBDesignable class LikeControl: UIControl {
    
    
    let likeButton = UIButton(type: .system)
    private let likesCounterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    var likeCounter: Int = 0
    
    
    let normalImage = UIImage(named: "likeOff")
    let selectedImage = UIImage(named: "likeOn")
    private var stackView : UIStackView!
    private var buttons: [UIView] = []
    private var isLiked : Bool = false {
        didSet {
            if true == isLiked {
                likeCounter += 1
                self.renderLiked()
                
            } else {
                likeCounter -= 1
                self.renderNotLiked()
                
            }
        }
    }
    
    override init(frame: CGRect) {
        print(2)
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        
        self.backgroundColor = .clear
        likesCounterLabel.text = "0"
        
        likeButton.addTarget(self, action: #selector(selectLike), for: .touchUpInside)
        likeButton.setBackgroundImage(normalImage, for: .normal)
        likeButton.setBackgroundImage(selectedImage, for: .selected)
        
        buttons.append(likeButton)
        buttons.append(likesCounterLabel)

        stackView = UIStackView(arrangedSubviews: buttons)
        
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        self.addSubview(stackView)
    }

    @objc private func selectLike(_ sender: UIButton) {
        UIView.transition(with: likeButton,
                          duration: 1, options: .transitionFlipFromLeft,
                          animations: {
                            self.likeButton.isSelected = true
        },
                          completion: nil)
        self.toggleLikedState()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    private func toggleLikedState() {
        self.isLiked = !self.isLiked
    }
    
    private func renderLiked() {
        print("render as liked")
        UIView.transition(with: likeButton,
                          duration: 1, options: .transitionFlipFromLeft,
                          animations: {
                            self.likeButton.isSelected = true
        },
                          completion: nil)
        likesCounterLabel.text = String(likeCounter)
    }
    
    private func renderNotLiked() {
        print("render as not liked")
        UIView.transition(with: likeButton,
                          duration: 0.8, options: .transitionFlipFromLeft,
                          animations: {
                            self.likeButton.isSelected = false
        },
                          completion: nil)
        likesCounterLabel.text = String(likeCounter)
    }

}
