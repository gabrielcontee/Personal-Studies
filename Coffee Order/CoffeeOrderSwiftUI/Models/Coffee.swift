//
//  Coffee.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

struct Coffee {

    let id: UUID = UUID()
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee: Identifiable {

    static func all() -> [Coffee] {

        return [Coffee(name: "Frapachino", imageURL: "Frapachino", price: 10.0),
                Coffee(name: "Hot Coffee", imageURL: "Hot Coffee", price: 8.0),
                Coffee(name: "Regular", imageURL: "Regular", price: 5.0),]
    }
}
