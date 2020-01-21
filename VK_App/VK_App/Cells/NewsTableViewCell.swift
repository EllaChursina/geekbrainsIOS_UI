//
//  NewsTableViewCell.swift
//  VK_App
//
//  Created by MacBook on 01/09/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var avatarFriendNewsImage: UIImageView!
    @IBOutlet var nameFriendNewsLabel: UILabel!
    @IBOutlet var dateNewsLabel: UILabel!
    @IBOutlet var descriptionNewsLabel: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var likeNewsLabel: LikeControl!
    @IBAction func shareNewsButton(_ sender: Any) {
    }
    @IBAction func commentNewsButton(_ sender: Any) {
    }
    @IBOutlet var numberOfNewsViews: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCellFromNews( _ news: News){
        self.avatarFriendNewsImage.image = UIImage(named: news.avatarFriendNews ?? "")
        self.nameFriendNewsLabel.text = news.nameFriendNews
        self.dateNewsLabel.text = news.dateNews
        self.descriptionNewsLabel.text = news.description
        self.newsImage.image = UIImage(named: news.newsImage ?? "")
        
        
    }
}
