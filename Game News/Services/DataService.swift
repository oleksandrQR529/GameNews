//
//  DataService.swift
//  Game News
//
//  Created by Саша on 09.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import Foundation
import UIKit

typealias OnAPISuccess = ([News]) -> Void
typealias OnAPIError = (String) -> Void

class DataService {
    static let instance = DataService()
        
    func loadNews(dataUrl urlString: String, searchNews: [String : Any], completion: @escaping ([News]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = searchNews.percentEscaped().data(using: .utf8)

        URLSession.shared.dataTask(with: request) { data, _, err in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }

                do{
                    let news = try JSONDecoder().decode([News].self, from: data)
                    completion(news)
                }catch let jsonErr{
                    print("Failed to decode: ", jsonErr)
                }
            }
        }.resume()
    }
    
    func addArticle(article: News, requestURL urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let articleAdded: [String : Any] = ["type" : article.type!, "top" : article.top!, "author" : article.click_url!, "title" : article.title!, "img" : article.img!, "description" : article.description!, "articleID" : article.articleID!, "time" : article.time!]
        request.httpBody = articleAdded.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request).resume()
    }
    
    func dropArticle(article: News, requestURL urlString: String, completion: (Bool) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let articleDeleted: [String : Any] = ["title" : article.title!, "articleID" : article.articleID!, "deleteNews" : "true"]
        request.httpBody = articleDeleted.percentEscaped().data(using: .utf8)
        
        URLSession.shared.dataTask(with: request).resume()
    }

}
