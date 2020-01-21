//
//  NewsViewController + UITableViewDataSource.swift
//  VK_App
//
//  Created by MacBook on 01/09/2019.
//  Copyright © 2019 EllaChursina. All rights reserved.
//

import UIKit
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        cell.setupCellFromNews(news[indexPath.row])
        return cell
    }
    
}
