//
//  SpaceDevsQueryResponse.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation
import Combine

protocol RESTAPIProtocol {
    typealias RequestModifier = ((URLRequest) -> URLRequest)
    
    var baseURL: String { get }
    var urlSession: URLSession { get }
}

extension RESTAPIProtocol {
    
    var urlSession: URLSession { URLSession.shared }
    
    func get(endpoint: String, requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func get(endpoint: String, queryItems: [String : String], requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        let items: [URLQueryItem] = queryItems.map({ URLQueryItem(name: $0.key, value: $0.value )})
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint).appending(queryItems: items) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        print(url)
        let request = URLRequest(url: url)
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func put(endpoint: String, body: Data?, requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = body
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func post(endpoint: String, body: Data?, requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func patch(endpoint: String, body: Data?, requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = body
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func delete(endpoint: String, requestModifier: @escaping RequestModifier = { $0 }) -> URLSession.ErasedDataTaskPublisher {
        guard let url = URL(string: "\(baseURL)")?.appendingPathComponent(endpoint) else {
            return Fail<URLSession.DataTaskPublisher.Output, Error>(error: API.URLError.unableToCreateURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        return createPublisher(for: request, requestModifier: requestModifier)
    }
    
    func createPublisher(for request: URLRequest, requestModifier: @escaping RequestModifier) -> URLSession.ErasedDataTaskPublisher {
        Just(request)
            .setFailureType(to: Error.self)
            .flatMap { [self] in
                urlSession.erasedDataTaskPublisher(for: requestModifier($0))
            }.eraseToAnyPublisher()
    }
}
