//
//  LaunchesDatesRangeModel.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import Foundation

class LaunchesDatesRangeModel {
    
    var startDate: Date
    var finishDate: Date
    
    private var numberOfWeeksToLoadPerRequest = 5
    
    init(startDate: Date = Date(),
         finishDate: Date = Date().getDateAhead(weeks: 1),
         numberOfWeeksToLoadPerRequest: Int =  5) {
        self.startDate = startDate
        self.finishDate = finishDate
        self.numberOfWeeksToLoadPerRequest = numberOfWeeksToLoadPerRequest
    }
    
    func updateDatesRangeForNextRequest() {
        startDate = finishDate.nextDay
        finishDate = startDate.getDateAhead(weeks: numberOfWeeksToLoadPerRequest)
    }
    
}
