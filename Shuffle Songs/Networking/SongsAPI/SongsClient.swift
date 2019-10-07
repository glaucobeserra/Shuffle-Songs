//
//  SongsClient.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

//class SongsClient: APIClient {
//    
//    let session: URLSession
//    
//    init(configuration: URLSessionConfiguration) {
//        self.session = URLSession(configuration: configuration)
//    }
//    
//    convenience init() {
//        self.init(configuration: .default)
//    }
    
//    func getMarketPrice(at timespan: Timespan, completion: @escaping (Result<MarketPrice?, APIError>) -> Void) {
//        let endpoint = BlockchainServices.marketPrice(timespan: timespan)
//        var request = endpoint.request
//        request?.httpMethod = endpoint.method.rawValue
//        
//        fetch(with: request, decode: { json -> MarketPrice? in
//            guard let marketPriceHistory = json as? MarketPrice else { return  nil }
//            return marketPriceHistory
//        }, completion: completion)
//    }
    
//    func getSongs(from artists: [Artists], completion: @escaping (Result<[Song]?, APIError>) -> Void) {
//        let endpoint = SongsService.getSongs(from: artists)
//        var request = endpoint.request
//    }
    
//}
