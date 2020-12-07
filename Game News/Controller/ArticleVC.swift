//
//  ArticleVC.swift
//  Game News
//
//  Created by Саша Дранчук on 06.12.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class ArticleVC: UIViewController {
    
    @IBOutlet weak var articleStack: ArticleStack!
    
    var article: Article = Article(from: JSONDecoder)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        articleStack.updateView(article: article)
    }

}
