//
//  LaunchListTile.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import SwiftUI

struct LaunchListTile: View {
    
    var image: String?
    var name: String
    var serviceProvider: String
    var webcastLive: Bool
    var launchTime: String
    
    var body: some View {
        
        HStack {
            if let url = URL(string: image ?? "") {
                LaunchRocketListTileImage(url: url)
                    .frame(width: 125, height: 200)
            } else {
                PhotoPlaceholder()
                    .frame(width: 125, height: 200)
            }
            VStack (alignment: .leading, spacing: 10) {
                LaunchInfoSectionRow(title: "Rocket", text: name)
                LaunchInfoSectionRow(title: "Service Provider", text: serviceProvider)
                LaunchInfoSectionRow(title: "Webcast live", text: webcastLive ? "Available" : "Not available")
                LaunchInfoSectionRow(title: "Launch time", text: launchTime.launchDate()?.calendarDateAsString ?? "Unknown")
            }
        }
        .background(Color.sectionTileBackground)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

fileprivate struct LaunchRocketListTileImage: View {
    
    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .frame(width: 125, height: 200)
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ZStack (alignment: .center) {
                ProgressView()
            }
            .frame(width: 125, height: 200)
        }
    }
}
