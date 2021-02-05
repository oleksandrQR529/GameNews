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
        let article: News? = News(title: articleTitleField.text ?? " ", type: typeSegment.titleForSegment(at: typeSegment.selectedSegmentIndex)!, articleID: self.articleID, img: articleImgUrlField.text ?? " ", click_url: articleAuthorField.text ?? "Some author", time: "2020-10-10", top: topSegment.selectedSegmentIndex, description: articleDescriptionField.text ?? " ")
        
        DataService.instance.addArticle(article: article!, requestURL: "http://localhost/news.php")
    }
    
}
