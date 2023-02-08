//
//  LaunchDetailsScreen.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import SwiftUI

struct LaunchDetailsScreen: View {
    
    var launch: RocketLaunch
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                if let url = URL(string: launch.image ?? "") {
                    LaunchRocketLargePhoto(url: url)
                } else {
                    PhotoPlaceholder()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .background(Color.sectionTileBackground)
                }
                VStack (alignment: .leading, spacing: 10) {
                    LaunchInfoSectionRow(title: "Rocket", text: launch.name)
                    LaunchInfoSectionRow(title: "Service Provider", text: launch.launchServiceProvider.name)
                    LaunchInfoSectionRow(title: "Webcast live", text: launch.webcastLive ? "Available" : "Not available")
                    LaunchInfoSectionRow(title: "Launch time", text: launch.net.launchDate()?.calendarDateAsString ?? "Unknown")
                    LaunchInfoSectionRow(title: "Status", text: launch.status.name)
                    LaunchInfoSectionRow(title: "Rocket family", text: launch.rocket.configuration.family)
                    LaunchInfoSectionRow(title: "Rocket variant", text: launch.rocket.configuration.variant)
                    LaunchInfoSectionRow(title: "Launch Provider type", text: launch.launchServiceProvider.agencyType?.rawValue ?? "Unknown")
                    LaunchInfoSectionRow(title: "Mission", text: launch.mission?.name ?? "Unknown")
                    LaunchInfoSectionRow(title: "Mission description", text: launch.mission?.description ?? "Unknown")
                }
                .padding(.horizontal)
                .padding(.vertical)
                Spacer()
            }
        }

    }
}

fileprivate struct LaunchRocketLargePhoto: View {

    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ZStack (alignment: .center) {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(Color.sectionTileBackground)
        }
    }
    
}
