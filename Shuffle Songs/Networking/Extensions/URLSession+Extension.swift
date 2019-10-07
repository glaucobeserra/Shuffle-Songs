//
//  URLSession+Extension.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {
    
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
