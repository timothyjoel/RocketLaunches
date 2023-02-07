//
//  SpaceDevsService.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation
import Combine

extension URLSession {
    typealias ErasedDataTaskPublisher = AnyPublisher<(data: Data, response: URLResponse), Error>
    
    func erasedDataTaskPublisher(
        for request: URLRequest
    ) -> ErasedDataTaskPublisher {
        dataTaskPublisher(for: request)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}
