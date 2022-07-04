//
//  UserDefaultsExtension.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

@propertyWrapper
struct CodableStorage<T>: DynamicProperty where T: Codable {
    
    let key: String
    @State private var value: T?
    
    init(wrappedValue: T? = nil, _ key: String) {
        self.key = key
        var initialValue: T? = nil
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            initialValue = try? JSONDecoder().decode(T.self, from: data)
        }
        self._value = State<T?>(initialValue: initialValue)
    }
    
    var wrappedValue: T? {
        get { value }
        nonmutating set {
            value = newValue
            UserDefaults.standard.setValue(try? JSONEncoder().encode(value), forKey: key)
        }
    }
    
    var projectedValue: Binding<T?> {
        Binding(get: { wrappedValue }, set: { wrappedValue = $0 })
    }
    
}
