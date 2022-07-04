//
//  StatsName.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 22/07/2021.
//

import Foundation

enum StatsName: String, CaseIterable {
    
    case visitors = "Visiteurs"
    case pageviews = "Vues"
    
    func id(for range: TimeRange) -> String {
        switch self {
        case .visitors:
            return range == .today || range == .yesterday ? "visitors_hours" : "visitors"
        case .pageviews:
            return range == .today || range == .yesterday ? "pageviews_hours" : "pageviews"
        }
    }
    
}
