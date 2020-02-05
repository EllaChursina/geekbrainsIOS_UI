//
//  CircleAvatarImageView.swift
//  VK_App
//
//  Created by Элла Чурсина on 29.01.2020.
//  Copyright © 2020 EllaChursina. All rights reserved.
//

import UIKit

class CircleAvatarImageView: UIImageView {
    
   override init(image: UIImage?) {
          super.init(image: image)
      }

      override init(frame: CGRect) {
          super.init(frame: frame)
          self.isUserInteractionEnabled = true
      }

      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
      }

      override func layoutSubviews() {
          super.layoutSubviews()
          self.layer.cornerRadius = self.frame.size.height / 2
          self.clipsToBounds = true
      }
}
