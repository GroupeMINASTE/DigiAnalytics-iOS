//
//  WebsiteChartsView.swift
//  DigiAnalytics (iOS)
//
//  Created by Nathan FALLET on 21/07/2021.
//

import SwiftUI
import SwiftUICharts

struct WebsiteChartsView: View {
    
    @State var website: Website
    @State var range: TimeRange = .today
    @State var charts = [Chart]()
    
    var body: some View {
        ScrollView {
            VStack {
                Picker(selection: $range, label: Text("Interval")) {
                    ForEach(TimeRange.allCases, id: \.rawValue) { range in
                        Text(range.rawValue).tag(range)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                LazyVGrid(columns: [
                    .init(.adaptive(minimum: 400))
                ]) {
                    ForEach(charts, id: \.name) { chart in
                        BarChartView(
                            data: ChartData(points: chart.data.map({ Double($0.count ?? "") ?? 0 })),
                            title: chart.name.rawValue,
                            form: ChartForm.large
                        )
                        .padding()
                    }
                }
            }
            .padding()
        }
        .navigationTitle(Text(website.url ?? "-"))
        .onAppear(perform: fetchStats)
        .onChange(of: website.url) { _ in fetchStats() }
        .onChange(of: range) { _ in fetchStats() }
    }
    
    func fetchStats() {
        charts = []
        for stat in StatsName.allCases {
            API.getStats(
                website: website.url,
                range: range,
                name: stat,
                currentPage: 1
            ) { data, status in
                if let data = data, let stats = data.data {
                    charts.append(Chart(name: stat, data: stats.sorted(by: { $0.value ?? "" < $1.value ?? "" })))
                }
            }
        }
    }
    
}

struct WebsiteChartsView_Previews: PreviewProvider {
    static var previews: some View {
        WebsiteChartsView(website: Website())
    }
}
