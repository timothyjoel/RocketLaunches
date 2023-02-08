//
//  DateFormatter+Ext.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 06/02/2023.
//

import Foundation

extension Date {
    
    func getDateAhead(weeks: Int) -> Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: weeks * 7, to: self)!
    }
    
    func getDateAhead(days: Int) -> Self {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: days, to: self)!
    }
    
    var convertedToSpaceDevsDateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00'Z'"
        return dateFormatter.string(from: self)
    }
    
    var calendarDateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
}
