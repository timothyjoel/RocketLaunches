//
//  LaunchResult.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct RocketLaunch: Codable, Identifiable {
    var uuid: UUID {
        UUID()
    }
    let id: String
    let url: String
    let name: String
    let status: LaunchStatus
    let net: String
    let launchServiceProvider: Agency
    let rocket: Rocket
    let mission: LaunchMission?
    let webcastLive: Bool
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case status
        case net
        case launchServiceProvider = "launch_service_provider"
        case rocket
        case mission
        case webcastLive = "webcast_live"
        case image
    }
}
