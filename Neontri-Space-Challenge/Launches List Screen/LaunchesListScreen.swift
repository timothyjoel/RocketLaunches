//
//  ContentView.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 05/02/2023.
//

import SwiftUI
import Combine

struct LaunchesListScreen: View {
    
    @StateObject var screenModel = LaunchesListScreenModel(spaceDevsService: API.SpaceDevsService(),
                                                           dateRange: LaunchesDatesRangeModel())
    @State var selectedLaunch: RocketLaunch?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                CustomScrollView(didScrollToBottom: $screenModel.shouldLoadNextLaunches) {
                    VStack (alignment: .leading) {
                        LaunchesList(launches: $screenModel.launches, selectedLaunch: $selectedLaunch)
                        if screenModel.isFetchingData {
                            NextLaunchesLoader()
                        }
                    }
                }
            }
            .navigationTitle(Text("Upcoming launches"))
            .sheet(item: $selectedLaunch, content: { launch in
                LaunchDetailsScreen(launch: launch)
            })
        }
    }
}

fileprivate struct LaunchesList: View {
    
    @Binding var launches: [RocketLaunch]
    @Binding var selectedLaunch: RocketLaunch?
    
    var body: some View {
        ForEach(launches, id: \.id) { launch in
            LaunchListTile(image: launch.image,
                           name: launch.name,
                           serviceProvider: launch.launchServiceProvider.name,
                           webcastLive: launch.webcastLive,
                           launchTime: launch.net)
            .onTapGesture {
                selectedLaunch = launch
            }
        }
    }
}

fileprivate struct NextLaunchesLoader: View {
    
    var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesListScreen()
    }
}
