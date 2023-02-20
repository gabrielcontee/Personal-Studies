//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 30/10/2022.
//

import Foundation

enum CoffeeSize: String, CaseIterable {

    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

class AddCoffeeOrderViewModel: ObservableObject {

    var name: String = ""
    @Published var size: String = CoffeeSize.medium.rawValue
    @Published var coffeeName: String = ""
    var totalPrice: Double { return calculateTotalPrice() }

    var coffeeList: [CoffeeViewModel] {

        return Coffee.all().map(CoffeeViewModel.init)
    }

    init() {}

    func placeOrder() {

        let order = Order(name: self.name,
                          size: self.size,
                          coffeeName: self.coffeeName,
                          total: self.totalPrice)

        Task {
            try await Webservice.createOrder(order)
        }
    }

    private func priceForSize(_ size: CoffeeSize) -> Double {

        switch size {

        case .small:
            return 1.0

        case .medium:
            return 1.5

        case .large:
            return 2.0
        }
    }

    private func calculateTotalPrice() -> Double {

        if let coffeeViewModel = coffeeList.first(where: { $0.name == coffeeName }),
           let coffeeSize = CoffeeSize(rawValue: self.size) {

            return coffeeViewModel.price * self.priceForSize(coffeeSize)
        } else {

            return 0.0
        }
    }
}
