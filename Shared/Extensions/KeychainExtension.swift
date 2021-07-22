//
//  KeychainExtension.swift
//  DigiAnalytics (iOS)
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI
import Keychain

extension Keychain {
    
    static let shared = Keychain()
    
}

@propertyWrapper
struct KeychainStorage: DynamicProperty {
    
    let key: String
    @State private var value: String
    
    init(wrappedValue: String = "", _ key: String) {
        self.key = key
        let initialValue = Keychain.shared.value(forKey: key) as? String ?? wrappedValue
        self._value = State<String>(initialValue: initialValue)
    }
    
    var wrappedValue: String {
        get { value }
        nonmutating set {
            value = newValue
            _ = Keychain.shared.save(value, forKey: key)
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
}
