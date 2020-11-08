//
//  NewsCell.swift
//  Game News
//
//  Created by Саша on 06.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class NewsImgCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView?
    @IBOutlet weak var newsTitle: UILabel?
    @IBOutlet weak var newsSource: UILabel?
    @IBOutlet weak var newsPublicationDate: UILabel?
    
    func updateCell(news: News) {
        newsTitle?.text = news.title
        newsSource?.text = news.click_url
        newsPublicationDate?.text = "- \(news.time)"
    }
    
    func setImg(news: News) {
        newsImg?.loadImgFromUrl(urlString: news.img!)
    }
}
