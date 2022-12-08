//
//  BarGraph.swift
//  ChartsSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import Foundation
import SwiftUI

struct BarGraph: View {

    let reports: [Report]

    var body: some View {

        VStack {
            HStack(alignment: .lastTextBaseline) {

                ForEach(self.reports, id: \.year) { report in

                    BarView(report: report)
                }
            }
        }
    }
}

struct BarView: View {

    let report: Report

    @State private var showGraph: Bool = false

    var body: some View {

        let value = report.revenue / 1000
        let yValue = Swift.min(value * 20, 500)

        return VStack {

            Text(String(format: "R$%.0f", report.revenue))

            Rectangle()
                .fill(.red)
                .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0.0)
                .onAppear {
                    withAnimation(.spring()) {
                        self.showGraph = true
                    }
                }

            Text(report.year)
        }
    }
}

struct BarGraph_Previews: PreviewProvider {

    static var previews: some View {

        BarGraph(reports: Report.all())
    }
}
