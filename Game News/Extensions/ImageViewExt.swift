//
//  ImageViewExt.swift
//  Game News
//
//  Created by Саша on 13.09.2020.
//  Copyright © 2020 Саша. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImgFromUrl(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data,_,err in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get img from url:", err)
                }
                
                guard let data = data else { return }
                
                self.image = UIImage(data: data)
            }
        }.resume()
    }
    
}
