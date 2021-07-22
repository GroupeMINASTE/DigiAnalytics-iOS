//
//  AccountLoadingView.swift
//  DigiAnalytics
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

struct AccountLoadingView: View {
    
    @Environment(\.apiKey) var apiKey
    @Environment(\.account) var account
    
    var body: some View {
        VStack {
            Text("Connexion en cours…")
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear(perform: fetchAccount)
        }
        .padding()
    }
    
    func fetchAccount() {
        API.getAccount { data, status in
            if let data = data, data.status == 200, status == .ok {
                self.account.wrappedValue = data.data
            } else {
                self.apiKey.wrappedValue = ""
            }
        }
    }
    
}

struct AccountLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountLoadingView()
    }
}
