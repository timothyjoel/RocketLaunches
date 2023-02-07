//
//  URLSession_EraseDataPublisher+Ext.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import Foundation
import Combine

extension URLSession.ErasedDataTaskPublisher {
    
    func unwrapResultJSONFromAPI() -> Self {
        tryMap {
            if let json = try JSONSerialization.jsonObject(with: $0.data, options: []) as? [String: Any],
               let result = (json["result"] as? [String: Any]) {
                let data = try JSONSerialization.data(withJSONObject: result, options: [])
                return (data: data, response: $0.response)
            }
            return $0
        }
        .eraseToAnyPublisher()
    }
    
}

extension URLSession.ErasedDataTaskPublisher {

    func catchResponseErrors() -> Self {
        tryMap { data, response -> URLSession.ErasedDataTaskPublisher.Output in
            guard let httpResponse = response as? HTTPURLResponse,
                200..<300 ~= httpResponse.statusCode else {
                    switch (response as! HTTPURLResponse).statusCode {
                    case 429:
                        throw API.SpaceDevsService.CustomError.tooManyRequests
                    default:
                        throw API.SpaceDevsService.CustomError.unknownError
                    }
            }
            return (data: data, response: response)
        }
        .eraseToAnyPublisher()
    }

}
