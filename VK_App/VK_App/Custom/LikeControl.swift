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
        self.toggleLikedState()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    
    private func toggleLikedState() {
        self.isLiked = !self.isLiked
    }
    
    private func renderLiked() {
        print("render as liked")
        likeButton.setBackgroundImage(selectedImage, for: .normal)
        likesCounterLabel.text = String(likeCounter)
        //todo
    }
    
    private func renderNotLiked() {
        likeButton.setBackgroundImage(normalImage, for: .normal)
        print("render as not liked")
        likesCounterLabel.text = String(likeCounter)
        //todo
    }

}
