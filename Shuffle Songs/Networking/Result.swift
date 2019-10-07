//
//  Result.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

enum Result<T>  {
    case success(T)
    case failure(APIError)
}
