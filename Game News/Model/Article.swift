//
//  Article.swift
//  Game News
//
//  Created by Саша Дранчук on 07.12.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation


struct Article: Codable {
    var title: String
    var description: String
    var img: String
    var type: String
}
