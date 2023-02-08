//
//  LaunchMission.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct LaunchMission: Codable {
    let id: Int
    let name: String
    let description: String
    let type: String
    let orbit: LaunchStatus
}
