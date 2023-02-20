//
//  ContentView.swift
//  AppleStocksSwiftUI
//
//  Created by Gabriel Conte on 26/12/2022.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var webService = Webservice()

    @State private var stocks: [Stock]? = nil

    var body: some View {
        VStack {
            let data = "\(self.stocks?.first?.symbol ?? "nil") \(self.stocks?.first?.description ?? "nil")"
            Button(self.stocks == nil ? "Fetch" : data) {
                Task {
                    self.stocks = try await webService.fetchStocks()
                }
            }.frame(width: 175, height: 175)
        }.background(self.webService.status == .fetched ? .green : .red)
            .foregroundColor(.white)
            .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
