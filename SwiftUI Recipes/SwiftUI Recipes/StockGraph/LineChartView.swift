//
//  LineChartView.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 26/12/2022.
//

import SwiftUI

struct LineChartView: View {

    let values: [Int]
    let labels: [String]

    var screenWidth: Double { UIScreen.main.bounds.width - 16.0 }

    private var path: Path {

        var path = Path()

        if values.isEmpty {
            return path
        }

        var offsetX = Int(screenWidth / CGFloat(values.count))
        let spaceBetweenValues = Int(screenWidth / CGFloat(values.count))
        path.move(to: CGPoint(x: offsetX, y: values[0]))

        values.forEach { value in

            offsetX += spaceBetweenValues
            path.addLine(to: CGPoint(x: offsetX, y: value))
        }

        return path
    }

    var body: some View {
        VStack {
            path.stroke(.white, lineWidth: 2.0)
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .frame(maxWidth: .infinity, maxHeight: 100)

            HStack {
                ForEach(self.labels, id: \.self) { year in
                    Text(year)
                        .frame(width: screenWidth / CGFloat(labels.count) - 10)
                }.foregroundColor(.white)
            }
        }
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(values: [100, 300, 200, 100],
                      labels: ["2010", "2011", "2012", "2013"])
    }
}

func getHistoricalStocks() -> [Stock] {

    var stocks = [Stock]()

    for _ in 1...20 {

        let stock = Stock(price: Double.random(in: 100...300))
        stocks.append(stock)
    }
    
    return stocks
}

var yearlyLabels: [String] {

    return (2016...2022).map { String($0) }
}
