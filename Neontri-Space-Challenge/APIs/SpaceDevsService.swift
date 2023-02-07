//
//  SpaceDevsService.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation
import Combine

protocol SpaceDevsServiceProtocol: RESTAPIProtocol {
    
    func fetchLaunches(startDate: Date, finishDate: Date) -> AnyPublisher<Result<SpaceDevsQueryResponse, API.SpaceDevsService.CustomError>, Never>
}

extension SpaceDevsServiceProtocol {
    
    var baseURL: String {
        "https://ll.thespacedevs.com/2.2.0/"
    }
    
    func fetchLaunches(startDate: Date, finishDate: Date) -> AnyPublisher<Result<SpaceDevsQueryResponse, API.SpaceDevsService.CustomError>, Never> {
        get(endpoint: "launch/", queryItems: ["net__gte": startDate.convertToSpaceDevsDate(), "net__lte": finishDate.convertToSpaceDevsDate()])
        .catchResponseErrors()
        .unwrapResultJSONFromAPI()
        .map { $0.data }
        .decodeFromJson(SpaceDevsQueryResponse.self)
        .receive(on: RunLoop.main)
        .map(Result.success)
        .catch { error in Just(.failure((error as? API.SpaceDevsService.CustomError) ?? .unknownError)) }
        .eraseToAnyPublisher()
    }

}

extension API {
    
    struct SpaceDevsService: SpaceDevsServiceProtocol {
        
        enum CustomError: Error {
            case tooManyRequests
            case unknownError
        }
        
    }
}
