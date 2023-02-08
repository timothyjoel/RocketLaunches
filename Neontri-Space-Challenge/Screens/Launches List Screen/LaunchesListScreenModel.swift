//
//  LaunchesScreenModel.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import Foundation
import Combine

final class LaunchesListScreenModel: ObservableObject {
    
    private var spaceDevsService: SpaceDevsServiceProtocol
    private var dateRange: LaunchesDatesRangeModel
    
    @Published var launches: [RocketLaunch] = []
    
    @Published var shouldLoadNextLaunches = false
    @Published var isFetchingData = false
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    
    init(spaceDevsService: SpaceDevsServiceProtocol,
         dateRange: LaunchesDatesRangeModel) {
        self.spaceDevsService = spaceDevsService
        self.dateRange = dateRange
        observeShouldLoudNextLaunches()
    }
    
    // MARK: - Methods
    
    func fetchLaunches() {
        isFetchingData = true
        spaceDevsService
            .fetchLaunches(startDate: dateRange.startDate,
                           finishDate: dateRange.finishDate)
            .sink(receiveValue: { [weak self] result in
                guard let self else { return }
                self.isFetchingData = false
                switch result {
                case .success(let response):
                    self.launches.append(contentsOf: response.results)
                    self.dateRange.updateDatesRangeForNextRequest()
                case .failure(let error):
                    switch error {
                    case .tooManyRequests:
                        print("Too many requests | This should be handled somehow, but was not part of the task.")
                    case .unknownError:
                        print("Unknown error | This should be handled somehow, but was not part of the task.")
                    }
                }
            })
            .store(in: &cancellables)
    }
    
    private func observeShouldLoudNextLaunches()  {
        $shouldLoadNextLaunches
            .removeDuplicates()
            .sink { [weak self] shouldUpdate in
                guard let self, shouldUpdate, !self.isFetchingData else { return }
                self.fetchLaunches()
            }
            .store(in: &cancellables)
    }
    
}
