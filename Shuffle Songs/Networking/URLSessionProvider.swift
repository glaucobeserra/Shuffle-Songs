//
//  URLSessionProvider.swift
//  Shuffle Songs
//
//  Created by Glauco Dantas Beserra on 06/10/19.
//  Copyright © 2019 Glauco Dantas Beserra. All rights reserved.
//

import Foundation

final class URLSessionProvider {
    
    private var session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func request<T:Decodable>(request service: Service,
                              type: T.Type,
                              completion: @escaping (Result<T>) -> ()) {
        let request = URLRequest(service: service)
        
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    func request<T:Decodable, B: Encodable>(request service: Service,
                                            type: T.Type,
                                            body: B,
                                            completion: @escaping (Result<T>) -> ()) {
        
        var request = URLRequest(service: service)
        guard let encodedBody = try? JSONEncoder().encode(body.self) else {
            completion(.failure(.unableToDecode))
            return
        }
        request.httpBody = encodedBody
        
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (Result<T>) -> ()) {
        guard let response = response else {
            return completion(.failure(.noInternetConnection))
        }
        
        guard error == nil else {
            return completion(.failure(.responseUnsuccessful))
        }
        
        let result = handleNetworkResponse(response)
        
        switch result {
        case .success:
            if let data = data {
                do {
                    let genericModel = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(genericModel))
                } catch {
                    let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(jsonData as Any)
                    completion(.failure(.unableToDecode))
                }
            } else {
                completion(.failure(.noData))
            }
        default:
            completion(.failure(result))
        }
    }
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> APIError {
        switch response.statusCode {
        case 200...299: return .success
        case 501...599: return .badRequest
        default: return .failed
        }
    }
}
