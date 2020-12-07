//
//  Article.swift
//  Game News
//
//  Created by Саша Дранчук on 07.12.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class ArticleStack: UIStackView {
    
    @IBOutlet weak var articleImg: UIImageView?
    @IBOutlet weak var articleTitle: UILabel?
    @IBOutlet weak var articleDescription: UITextView?
    
    func updateView(article: Article) {
        articleTitle?.text = article.title
        articleDescription?.text = article.description
        articleImg?.loadImgFromUrl(urlString: article.img)
    }
    
}
