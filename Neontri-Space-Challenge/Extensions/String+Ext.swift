//
//  String+Ext.swift
//  Neontri-Space-Challenge
//
//  Created by Timothy Stokarski on 07/02/2023.
//

import Foundation

extension String {
    
    func launchDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter.date(from: self)
    }
    
    
}
