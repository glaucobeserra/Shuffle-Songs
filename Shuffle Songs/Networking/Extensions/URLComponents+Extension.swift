//
//  URLComponents+Extension.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

extension URLComponents {
    init(service: URLComponentsProtocol) {
        self.init()
        scheme = service.scheme
        host = service.host
        path = service.path
        if let query = service.query {
            queryItems = query.map { (key, value) in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
    }
}
