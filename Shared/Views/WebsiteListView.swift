//
//  WebsiteListView.swift
//  DigiAnalytics (iOS)
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI

struct WebsiteListView: View {
    
    @State var currentPage: Int64 = 0
    @State var lastPage: Int64? = nil
    @State var websites = [Website]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(websites, id: \.id) { website in
                    NavigationLink(destination: WebsiteChartsView(website: website)) {
                        Text(website.url ?? "-")
                    }
                }
                if currentPage != lastPage {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear(perform: fetchWebsites)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle(Text("Mes sites web"))
            Text("Selectionnez un site dans la liste de gauche")
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    func fetchWebsites() {
        API.getWebsites(currentPage: currentPage + 1) { data, status in
            if let data = data {
                self.websites.append(contentsOf: data.data ?? [])
                self.currentPage = (data.meta?.current_page ?? 1)
                self.lastPage = data.meta?.last_page
            }
        }
    }
    
}

struct WebsiteListView_Previews: PreviewProvider {
    static var previews: some View {
        WebsiteListView()
    }
}
