//
//  News.swift
//  Game News
//
//  Created by Саша on 09.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation


struct News: Codable {
    var title: String
    var type: String
    var articleID: Int
    var img: String
    var click_url: String
    var time: String
    var top: Int
    var description: String
}
