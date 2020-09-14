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
    
    func updateCell(title: String, source: String, publicationDate: String) {
        newsTitle?.text = title
        newsSource?.text = source
        newsPublicationDate?.text = publicationDate
    }
    
    func setImg(urlString: String) {
        newsImg?.loadImgFromUrl(urlString: urlString)
    }
}
