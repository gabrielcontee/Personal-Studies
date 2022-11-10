//
//  Order.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

struct Order: Codable {

    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
