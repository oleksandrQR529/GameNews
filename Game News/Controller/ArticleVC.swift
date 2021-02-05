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
    
    var articleID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        loadData()
    }
    
    private func loadData() {
        DataService.instance.loadNews(dataUrl: "http://localhost/news1.php", searchNews: ["articleID" : articleID!]) { (article) in
            self.articleStack.updateView(article: article[0])
        }
    }

}
