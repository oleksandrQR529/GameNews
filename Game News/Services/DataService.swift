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
    
    func loadArticle(dataUrl urlString: String, searchArticle: [String : Any], completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = searchArticle.percentEscaped().data(using: .utf8)

        URLSession.shared.dataTask(with: request) { data, _, err in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }

                do{
                    let article = try JSONDecoder().decode([Article].self, from: data)
                    completion(article)
                }catch let jsonErr{
                    print("Failed to decode: ", jsonErr)
                }
            }
        }.resume()
    }
    
    func addArticle(article: News, requestURL urlString: String, completion: (Bool) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let articleAdded: [String : Any] = ["type" : article.type, "top" : article.top, "author" : article.click_url, "title" : article.title, "img" : article.img, "description" : article.description, "articleID" : article.articleID, "addArticle" : "true"]
        request.httpBody = articleAdded.percentEscaped().data(using: .utf8)
    }

}
