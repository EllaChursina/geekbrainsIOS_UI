//
//  NewsViewController.swift
//  VK_App
//
//  Created by MacBook on 01/09/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

  
    @IBOutlet var newsTableView: UITableView!
    
    
    var news: [News] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        //self.newsTableView.rowHeight = 600
        
        news.append(News(avatarFriendNews: "2", nameFriendNews: "SNIAKERMANIA", dateNews: "54 minutes ago", description: "Ретро постеры кроссовок - это стилек", newsImage: "news_snicker1"))
        news.append(News(avatarFriendNews: "3", nameFriendNews: "SNIAKERMANIA", dateNews: "yesterday at 14:42", description: "Vans подготовил коллаборацию с брендом очков RETROSUPERFUTURE. Будет выпущено 2 версии кед. Будет выпущено с 13-го сентября", newsImage: "news_snicker2"))
        news.append(News(avatarFriendNews: "4", nameFriendNews: "Очень надо!", dateNews: "yesterday at 09:10", description: "В осенних коллекциях сейчас очень много нетипичных для осени цветов: пудрово-нежных и очень ярких. Мне нравится!", newsImage: "news_ochen"))
        news.append(News(avatarFriendNews: "5", nameFriendNews: "Искусство", dateNews: "today at 08:00", description: "Доброе утро! Представляем вашему вниманию фрагмент картины. Как считаете, кто автор этой работы? Ответ опубликуем вечером!", newsImage: "news_art"))
        news.append(News(avatarFriendNews: "6", nameFriendNews: "Новая Визуальная Культура", dateNews: "today at 13:51", description: "В Екатеринбурге коммунальщики закатали в гудрон граффити Покраса Лампаса, которое он выписывал несколько дней. Асфальт кладут прямо на тротуарную плитку.", newsImage: "news_pokras"))
        
        self.newsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
