//
//  LaunchProgram.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import Foundation

struct Program: Codable {
    let id: Int
    let url: String
    let name, description: String
    let agencies: [Agency]
    let imageURL: String
    let startDate: String
    let infoURL: String
    let wikiURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case description
        case agencies
        case imageURL = "image_url"
        case startDate = "start_date"
        case infoURL = "info_url"
        case wikiURL = "wiki_url"
    }
}
