//
//  EnvironmentValuesExtension.swift
//  DigiAnalytics (iOS)
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

private struct APIKeyKey: EnvironmentKey {
    static let defaultValue = Binding.constant("")
}

private struct AccountKey: EnvironmentKey {
    static let defaultValue = Binding.constant(nil as Account?)
}

extension EnvironmentValues {
    
    var apiKey: Binding<String> {
        get { self[APIKeyKey.self] }
        set { self[APIKeyKey.self] = newValue }
    }
    
    var account: Binding<Account?> {
        get { self[AccountKey.self] }
        set { self[AccountKey.self] = newValue }
    }
    
}
