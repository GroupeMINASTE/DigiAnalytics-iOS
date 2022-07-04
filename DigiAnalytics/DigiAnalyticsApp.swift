//
//  DigiAnalyticsApp.swift
//  Shared
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

@main
struct DigiAnalyticsApp: App {
    
    @KeychainStorage("apiKey") var apiKey
    @CodableStorage<Account>("account") var account
    
    init() {
        // Configure API
        API.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if apiKey.isEmpty {
                APIKeyView()
                    .environment(\.apiKey, $apiKey)
                    .environment(\.account, $account)
            } else if account == nil {
                AccountLoadingView()
                    .environment(\.apiKey, $apiKey)
                    .environment(\.account, $account)
            } else {
                WebsiteListView()
                    .environment(\.apiKey, $apiKey)
                    .environment(\.account, $account)
            }
        }
        .commands {
            SidebarCommands()
        }
    }
    
}
