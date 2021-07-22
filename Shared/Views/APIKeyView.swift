//
//  APIKeyView.swift
//  DigiAnalytics (iOS)
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

struct APIKeyView: View {
    
    @Environment(\.apiKey) var apiKey
    @Environment(\.openURL) var openURL
    
    @State var input = ""
    
    var body: some View {
        VStack {
            Text("Connectez vous à l'aide de votre clé d'API")
                .multilineTextAlignment(.center)
            TextField("Clé d'API", text: $input)
            Button("Connexion") {
                self.apiKey.wrappedValue = input
            }
            Button("Trouver ma clé d'API") {
                if let url = URL(string: "https://digianalytics.fr/settings/api") {
                    openURL(url)
                }
            }
        }
        .padding()
    }
    
}

struct APIKeyView_Previews: PreviewProvider {
    static var previews: some View {
        APIKeyView()
    }
}
