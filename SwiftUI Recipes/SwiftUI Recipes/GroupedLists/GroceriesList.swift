//
//  GroceriesList.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 16/12/2022.
//

import Foundation

struct GroceryCategory {

    let title: String
    let groceryItems: [GroceryItems]
}

struct GroceryItems {

    let title: String
    let price: Double
}

extension GroceryCategory {

    static func all() -> [GroceryCategory] {

        return [
            GroceryCategory(title: "Meats", groceryItems: [GroceryItems(title: "cow", price: 30.0), GroceryItems(title: "Fish", price: 15.0)]),
            GroceryCategory(title: "Vegetables", groceryItems: [GroceryItems(title: "leccuce", price: 3.0), GroceryItems(title: "Tomato", price: 5.0)]),
            GroceryCategory(title: "Drinks", groceryItems: [GroceryItems(title: "soda", price: 6.0), GroceryItems(title: "Juice", price: 8.0)])
        ]
    }
}
