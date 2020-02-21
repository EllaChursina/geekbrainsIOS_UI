//
//  FriendsPhotoController.swift
//  VK_App
//
//  Created by MacBook on 09/07/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit


class FriendsPhotoController: UICollectionViewController {
    
    
    @IBOutlet var photosView: UICollectionView!
    
    var photos = [UIImage]()
        var selectedIndex:IndexPath?
        
        static func storyboardInstance() -> DetailFriendsPhotoController? {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "DetailFriendsPhotoController") as? DetailFriendsPhotoController
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }

       



        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of items
            return photos.count
        }

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCollectionViewCell", for: indexPath) as! FriendsPhotoCollectionViewCell
            cell.friendsPhoto.image = photos[indexPath.item]
        
            // Configure the cell
        
            return cell
        }
        
        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            collectionView.deselectItem(at: indexPath, animated: true)
            guard let testVC = FriendsPhotoController.storyboardInstance() else { return }
            testVC.photo = photos[indexPath.row]
            let navigationController = UINavigationController(rootViewController: testVC)
            navigationController.modalPresentationStyle = .currentContext

    //        self.present(navigationController, animated: true, completion: nil)
            let transition = CATransition()
            transition.duration = 0.25
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            present(navigationController, animated: false, completion: nil)
        }

    
//    var photos = [UIImage]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhotoCollectionViewCell", for: indexPath) as! FriendsPhotoCollectionViewCell
//        cell.friendsPhoto.image = photos[indexPath.item]
//        return cell
//    }
//
////    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailFriendPhoto") as? DetailFriendsPhotoController else { return }
/////      let detailPhoto = photos[indexPath.item]
/////           vc.detailFriendsPhoto = detailPhoto
////            self.navigationController?.pushViewController(vc, animated: true)
////    }
////
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "DetailFriendsPhotoSegue",
////       let indexPath = photosView.indexPathsForSelectedItems,
//        let vc = segue.destination as? DetailFriendsPhotoController  {
//        print("showDetailController")
//        }
//    }
//    // MARK: UICollectionViewDelegate
//
//    /*
//    // Uncomment this method to specify if the specified item should be highlighted during tracking
//    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment this method to specify if the specified item should be selected
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    */
//
//    /*
//    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
//    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
//        return false
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
//
//    }
//    */

}
