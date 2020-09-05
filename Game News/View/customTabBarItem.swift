//
//  customTabBarItem.swift
//  Game News
//
//  Created by Саша on 04.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

class customTabBarItem: UITabBarItem {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UITabBarItem.appearance().setTitleTextAttributes([kCTFontAttributeName as NSAttributedString.Key: UIFont.boldSystemFont(ofSize: 15.0)], for: .normal)
    }

}
