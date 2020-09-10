//
//  DataService.swift
//  Game News
//
//  Created by Саша on 09.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private var data: [News] = []
    
    func loadData(dataUrl urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let news = try JSONDecoder().decode([News].self, from: data)
                self.data = news
            }catch{
                print(<#T##items: Any...##Any#>)
            }
        }
    }
    
    func fetchData() -> [News] {
        return data
    }
}
