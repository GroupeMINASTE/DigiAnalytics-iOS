//
//  API.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import Foundation
import APIRequest
import Keychain

struct API {
    
    // Endpoints
    
    static func getAccount(
        completionHandler: @escaping (APIResponse<Account>?, APIResponseStatus) -> Void
    ) {
        execute(
            "GET",
            path: "/api/v1/account",
            completionHandler: completionHandler
        )
    }
    
    static func getWebsites(
        currentPage: Int64,
        completionHandler: @escaping (APIResponse<[Website]>?, APIResponseStatus) -> Void
    ) {
        execute(
            "GET",
            path: "/api/v1/websites",
            params: ["page": String(currentPage)],
            completionHandler: completionHandler
        )
    }
    
    static func getStats(
        website: String?,
        range: TimeRange,
        name: StatsName,
        currentPage: Int64,
        completionHandler: @escaping (APIResponse<[Stats]>?, APIResponseStatus) -> Void
    ) {
        let (from, to) = range.fromTo
        execute(
            "GET",
            path: "/api/v1/stats/\(website ?? "")",
            params: ["page": String(currentPage), "from": from, "to": to, "name": name.id(for: range)],
            completionHandler: completionHandler
        )
    }
    
    // Methods
    
    static func configure() {
        // Set configuration
        APIConfiguration.current = APIConfiguration(host: "digianalytics.fr")
    }
    
    private static func execute<T>(
        _ method: String,
        path: String,
        body: Encodable? = nil,
        params: [String: String]? = nil,
        completionHandler: @escaping (T?, APIResponseStatus) -> Void
    ) where T: Decodable {
        // Create a request
        let request = APIRequest(method, path: path)
        
        // Assign args
        if let token = Keychain.shared.value(forKey: "apiKey") as? String {
            request.with(header: "Authorization", value: "Bearer \(token)")
        }
        if let body = body {
            request.with(body: body)
        }
        if let params = params {
            for param in params.enumerated() {
                request.with(name: param.element.key, value: param.element.value)
            }
        }
        
        // Execute
        request.execute(T.self, completionHandler: completionHandler)
    }
    
}
