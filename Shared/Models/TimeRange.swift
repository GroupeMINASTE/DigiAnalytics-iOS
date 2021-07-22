//
//  TimeRange.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 22/07/2021.
//

import Foundation

enum TimeRange: String, CaseIterable {
    
    case today = "Aujourd'hui"
    case yesterday = "Hier"
    case last7days = "7 derniers jours"
    case last30days = "30 derniers jours"
    
    var fromTo: (String, String) {
        switch self {
        // Yerterday
        case .yesterday:
            let t = Calendar.current.date(byAdding: .day, value: -1, to: Date())!.asString
            return (t, t)
        // Last 7 days
        case .last7days:
            return (Calendar.current.date(byAdding: .day, value: -6, to: Date())!.asString, Date().asString)
        // Last 30 days
        case .last30days:
            return (Calendar.current.date(byAdding: .day, value: -29, to: Date())!.asString, Date().asString)
        // Default: Today
        default:
            let t = Date().asString
            return (t, t)
        }
    }
    
}
