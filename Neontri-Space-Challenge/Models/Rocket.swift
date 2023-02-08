//
//  Rocket.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct Rocket: Codable {
    
    let id: Int
    let configuration: RocketConfiguration
    
}

struct RocketConfiguration: Codable {
    
    let id: Int
    let url: String
    let name: String
    let family: String
    let fullName: String
    let variant: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case family
        case fullName = "full_name"
        case variant
    }
}
