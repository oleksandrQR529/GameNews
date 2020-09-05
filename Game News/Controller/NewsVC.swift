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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topNewsCollection.dataSource = self
        topNewsCollection.delegate = self
    }

}

extension NewsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    
    
}
