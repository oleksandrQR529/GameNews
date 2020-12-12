//
//  AddArticleVC.swift
//  Game News
//
//  Created by Саша Дранчук on 11.12.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class AddArticleVC: UIViewController {
    @IBOutlet weak var typeSegment: UISegmentedControl!
    @IBOutlet weak var topSegment: UISegmentedControl!
    @IBOutlet weak var articleAuthorField: UITextField!
    @IBOutlet weak var articleTitleField: UITextField!
    @IBOutlet weak var articleImgUrlField: UITextField!
    @IBOutlet weak var articleDescriptionField: UITextField!
    
    var articleID = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        var article: News?
        article?.type = typeSegment.titleForSegment(at: typeSegment.selectedSegmentIndex)!
        article?.top = topSegment.selectedSegmentIndex
        article?.click_url = articleAuthorField.text ?? "Some author"
        article?.title = articleTitleField.text ?? " "
        article?.img = articleImgUrlField.text ?? " "
        article?.description = articleDescriptionField.text ?? " "
        article?.articleID = self.articleID;
        
        DataService.instance.addArticle(article: article!, requestURL: "http://localhost/news.php") { (isComplete) in
            //go to news vc
        }
    }
    
}
