//
//  URLRequest+Extension.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init(service: Service) {
        let urlComponents = URLComponents(service: service)
        guard let url = urlComponents.url else {
            fatalError("\nVerifique a URL, em especial o PATH!\n")
        }
        self.init(url: url)
        allHTTPHeaderFields = service.headers
        httpMethod = service.method.rawValue
    }
}
