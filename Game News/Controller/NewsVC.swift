//
//  NewsVC.swift
//  Game News
//
//  Created by Саша on 04.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet weak var topNewsCollection: UICollectionView!
    @IBOutlet weak var newsTable: UITableView!
    
    private var topNews: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        DataService.instance.loadData(dataUrl: "http://localhost/news.php", view: newsTable)
        DataService.instance.loadData(dataUrl: "http://localhost/news.php", view: topNewsCollection)
    }
    
    func initUI() {
        topNewsCollection.dataSource = self
        topNewsCollection.delegate = self
        
        newsTable.dataSource = self
        newsTable.delegate = self
        
        newsTable.rowHeight = UITableView.automaticDimension
    }
}

extension NewsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var topNewsCount = 0
        for news in DataService.instance.fetchData() {
            if news.top == "0" {
            }else {
                topNewsCount += 1
                self.topNews.append(news)
            }
        }
        return topNewsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topNewsCell", for: indexPath) as? TopNewsCell {
            cell.updateCell(news: topNews[indexPath.row])
            cell.setImg(news: topNews[indexPath.row])
            
            return cell
        }else {
            return TopNewsCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.fetchData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = DataService.instance.fetchData()
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsImgCell", for: indexPath) as? NewsImgCell
            {
            cell.updateCell(news: news[indexPath.row])
            cell.setImg(news: news[indexPath.row])
            return cell
        }else {
            return NewsImgCell()
        }
    }
}
