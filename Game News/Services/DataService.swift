//
//  DataService.swift
//  Game News
//
//  Created by Саша on 09.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    private var data: [News] = []
    
    func loadData(dataUrl urlString: String, view: UITableView) {  //add support colleciton view, or BETTER, reload view in another way
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, err in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                }
                
                guard let data = data else { return }

                do{
                    let news = try JSONDecoder().decode([News].self, from: data)
                    self.data = news
                    view.reloadData()
                }catch let jsonErr{
                    print("Failed to decode: ", jsonErr)
                }
            }
        }.resume()
    }
    
    func fetchData() -> [News] {
        return data
    }
}
