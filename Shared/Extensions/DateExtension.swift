//
//  DateExtension.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 22/07/2021.
//

import Foundation

extension Date {
    
    var asString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
}
