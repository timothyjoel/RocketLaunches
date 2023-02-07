//
//  LaunchServiceProvider.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct Agency: Codable {
    let id: Int
    let url: String
    let name: String
  //  let agencyType: AgencyType
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
    //    case agencyType = "type"
    }
}

enum AgencyType: String, Codable {
    case commercial = "Commercial"
    case government = "Government"
    case multinational = "Multinational"
}
