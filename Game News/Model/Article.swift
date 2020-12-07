//
//  Article.swift
//  Game News
//
//  Created by Саша Дранчук on 07.12.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation


struct Article: Codable {
    private(set) public var title: String
    private(set) public var description: String
    private(set) public var img: String
    private(set) public var type: String
}
