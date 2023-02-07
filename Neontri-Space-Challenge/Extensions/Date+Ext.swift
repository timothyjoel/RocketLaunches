//
//  DateFormatter+Ext.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import Foundation

extension Date {
    
    func convertToSpaceDevsDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00'Z'"
        return dateFormatter.string(from: self)
    }
    
    func getDateAhead(weeks: Int) -> Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: weeks * 7, to: self)!
    }
    
    func getDateAhead(days: Int) -> Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    var nextDay: Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 1, to: self)!
    }
    
    var calendarDateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
}
