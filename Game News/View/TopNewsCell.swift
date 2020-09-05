//
//  TopNewsCell.swift
//  Game News
//
//  Created by Саша on 05.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class TopNewsCell: UICollectionViewCell {
    
    @IBOutlet weak var topNewsImg: UIImageView!
    @IBOutlet weak var topNewsTitle: UILabel!
    @IBOutlet weak var topNewsSource: UILabel!
    @IBOutlet weak var topNewsPublicationDate: UILabel!
    
    func updateCell(img: UIImage, title: String, source: String, publicationDate: String) {
        topNewsImg.image = img
        topNewsTitle.text = title
        topNewsSource.text = source
        topNewsPublicationDate.text = publicationDate
    }
}
