//
//  Account.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import Foundation

struct Account: Codable, Equatable {
    
    var id: Int64?
    var name: String?
    var email: String?
    var avatar_url: String?
    var locale: String?
    var timezone: String?
    var created_at: String?
    
}
