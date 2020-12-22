//
//  NewsVC.swift
//  Game News
//
//  Created by Саша on 04.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTypeSegments: UISegmentedControl!
    @IBOutlet weak var newsNavigationItem: UINavigationItem!
    
    private var request: String?
    private var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    private func initUI() {
        loadData()
        
        newsTable.dataSource = self
        newsTable.delegate = self
        newsTable.rowHeight = UITableView.automaticDimension
        
        searchBar.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add article", style: .plain, target: self, action: #selector(addArticleBtnPressed))
    }
    
    private func loadData() {
        DataService.instance.loadNews(dataUrl: "http://localhost/news1.php", searchNews: ["newsType" : self.request ?? "allNews"]) { (news) in
            self.news = news
            self.newsTable.reloadData()
        }
    }
    
    @IBAction func newsTypeChanged(_ sender: Any) {
        switch newsTypeSegments.titleForSegment(at: newsTypeSegments.selectedSegmentIndex) {
        case "All News":
            self.request = "allNews"
            break
        case "Top News":
            self.request = "topNews"
            break
        case "PC News":
            self.request = "pcNews"
            break
        case "Mobile News":
            self.request = "mobileNews"
            break
        default:
            break
        }
        loadData()
    }
    
    @objc func addArticleBtnPressed() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AddArticleVC") as? AddArticleVC
        nextViewController?.modalPresentationStyle = .fullScreen
        self.present(nextViewController!, animated:true, completion:nil)
    }
    
    @IBAction func unwindFromGoalsVC(unwindSegue: UIStoryboardSegue){}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let articleVC = segue.destination as? ArticleVC {
            let selectedRow = newsTable.indexPathForSelectedRow?.row
            articleVC.articleID = news[selectedRow ?? 1].articleID
        }else if let addArticleVC = segue.destination as? AddArticleVC {
            addArticleVC.articleID = news.count + 1
        }
    }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsImgCell", for: indexPath) as? NewsImgCell
            {
            cell.updateCell(news: news[indexPath.row])
            cell.setImg(news: news[indexPath.row])
            return cell
        }else {
            return NewsImgCell()
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            DataService.instance.dropArticle(article: self.news[indexPath.row], requestURL: "http://localhost/news.php") { (isCompelte) in
                self.loadData()
            }
            
            tableView.deleteRows(at:[indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [deleteAction]
    }
}

extension NewsVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        switch searchBar.text {
        case "All news":
            self.request = "allNews"
            break
        case "Top news":
            self.request = "topNews"
            break
        case "PC news":
            self.request = "pcNews"
            break
        case "Mobile news":
            self.request = "mobileNews"
            break
        default:
            self.request = searchBar.text
        }
        loadData()
        
    }
    
}
