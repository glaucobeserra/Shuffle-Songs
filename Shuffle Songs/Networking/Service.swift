//
//  Service.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

typealias Service = URLComponentsProtocol & RequestProtocol

protocol URLComponentsProtocol {
    var scheme: String { get }
    var host:   String { get }
    var path:   String { get }
    var query: [String: Any]? { get }
}

protocol RequestProtocol {
    var headers:    [String:String]? { get }
    var method:     HTTPMethod { get }
}
