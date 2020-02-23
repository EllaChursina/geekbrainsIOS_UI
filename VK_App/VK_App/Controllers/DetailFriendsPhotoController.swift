//
//  DetailFriendsPhotoController.swift
//  VK_App
//
//  Created by Элла Чурсина on 06.02.2020.
//  Copyright © 2020 EllaChursina. All rights reserved.
//

import UIKit

class DetailFriendsPhotoController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    var photo: UIImage?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backTapped))

            guard  let openedPhoto = photo else { return }
            detailImageView.image = openedPhoto
        }

        @objc func backTapped() {
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            view.window!.layer.add(transition, forKey: nil)
            dismiss(animated: false)
    //        dismiss(animated: true, completion: nil)
        }
    
    
    
//    var detailFriendsPhoto = UIImage(){
//        didSet {
//         print("Friend's photo is chosen")
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        detailFriendsPhotoImageView.backgroundColor = .green
//        //detailFriendsPhotoImageView.image = detailFriendsPhoto
//    }
    

}
