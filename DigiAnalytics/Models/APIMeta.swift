//
//  APIMeta.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import Foundation

struct APIMeta: Codable {
    
    var current_page: Int64?
    var from: Int64?
    var last_page: Int64?
    var to: Int64?
    var total: Int64?
    
}
