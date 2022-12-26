//
//  StockView.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 26/12/2022.
//

import SwiftUI

struct Stock {

    let price: Double
}

struct StockView: View {

    let prices =  getHistoricalStocks().map { Int($0.price) }

    var body: some View {
        VStack {
            LineChartView(values: prices, labels: yearlyLabels)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
