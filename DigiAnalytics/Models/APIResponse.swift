//
//  APIResponse.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    
    var data: T?
    var meta: APIMeta?
    var status: Int?
    
}
