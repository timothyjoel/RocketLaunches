//
//  SpaceDevsQueryResponse.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct SpaceDevsQueryResponse: Codable {
    let count: Int
    let results: [RocketLaunch]
}
