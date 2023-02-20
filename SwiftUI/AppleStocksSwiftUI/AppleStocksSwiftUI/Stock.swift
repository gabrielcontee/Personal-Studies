//
//  Stock.swift
//  AppleStocksSwiftUI
//
//  Created by Gabriel Conte on 26/12/2022.
//

import Foundation

struct Stock: Decodable {

    let symbol: String
    let description: String
    let price: Double
    let change: String
}
