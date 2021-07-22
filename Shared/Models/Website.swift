//
//  Website.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import Foundation

struct Website: Codable, Equatable {
    
    var id: Int64?
    var url: String?
    var user_id: Int64?
    var privacy: Int?
    var email: String?
    var exclude_bots: Int?
    var exclude_ips: Int?
    var created_at: String?
    var updated_at: String?
    
}
