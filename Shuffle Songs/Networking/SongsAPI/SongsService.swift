//
//  SongsService.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

enum SongsService {
    case getSongs(from: [Artists])
}

extension SongsService: Service {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "us-central1-tw-exercicio-mobile.cloudfunctions.net"
    }
    
    var path: String {
        return "/lookup"
    }
    
    var query: [String : Any]? {
        switch self {
        case .getSongs(let artists):
            var artistIDList: String = ""
            artistIDList = artists.map {String($0.rawValue)}.joined(separator: ",")
            return ["id":artistIDList, "limit":2]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
