//
//  APIError.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

enum APIError: Error {
    case success
    case noInternetConnection
    case badRequest
    case failed
    case noData
    case unableToDecode
    case responseUnsuccessful
    
    var localizedDescription: String {
        switch self {
        case .success:              return "Success"
        case .noInternetConnection: return "Please check your network connection."
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .noData:               return "Response returned with no data to decode."
        case .badRequest:           return "Bad request"
        case .failed:               return "Network request failed."
        case .unableToDecode:       return "We could not decode the response."
        }
    }
}
