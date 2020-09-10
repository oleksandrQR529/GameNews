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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.instance.loadData(dataUrl: "http://188.40.167.45:3001/")
        initUI()
    }
    
    func initUI() {
        topNewsCollection.dataSource = self
        topNewsCollection.delegate = self
        
        newsTable.dataSource = self
        newsTable.delegate = self
    }
}

extension NewsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 //top news count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topNewsCell", for: indexPath) as? TopNewsCell {
            cell.updateCell(img: UIImage(named: "digital.png")!, title: "Mersedes-Benz and Laureus broadening their worldwide involvement", source: "Apple.com", publicationDate: "- 2 hours ago")
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
        return DataService.instance.fetchData().count //news count (must be 5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCell {
//            cell.updateCell(img: UIImage(named: "digital.png")!, title: "Mersedes-Benz and Laureus broadening their worldwide involvement", source: "Apple.com", publicationDate: "- 2 hours ago")
//            return cell
//        }else {
//            return NewsCell()
//        }
        let news = DataService.instance.fetchData()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsCell {
            cell.updateCell(img: <#T##UIImage#>, title: news[indexPath.row].title, source: news[indexPath.row].click_url, publicationDate: news[indexPath.row].time)
        }
    }
}
