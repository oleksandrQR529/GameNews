//
//  NewsCell.swift
//  Game News
//
//  Created by Саша on 06.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsPublicationDate: UILabel!
    
    func updateCell(img: UIImage, title: String, source: String, publicationDate: String) {
        newsImg.image = img
        newsTitle.text = title
        newsSource.text = source
        newsPublicationDate.text = publicationDate
    }
}
