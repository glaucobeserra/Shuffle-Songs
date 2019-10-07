//
//  UIImageView+Extension.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 07/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSURL, UIImage>()

extension UIImageView {
    
    func loadImageUsingUrl(url: URL) {
        let nsURL = url as NSURL
        
        if let imageFromCache = imageCache.object(forKey: nsURL) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: nsURL)
                    UIView.transition(with: self,
                                      duration:0.5,
                                      options: .transitionCrossDissolve,
                                      animations: { self.image = image },
                                      completion: nil)
                }
            }
        }.resume()
    }
}
