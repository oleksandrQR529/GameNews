//
//  News.swift
//  Game News
//
//  Created by Саша on 09.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation


struct News: Codable {
    private(set) public var title: String
    private(set) public var type: String
    private(set) public var img: String?
    private(set) public var click_url: String
    private(set) public var time: String
    private(set) public var top: String
}
