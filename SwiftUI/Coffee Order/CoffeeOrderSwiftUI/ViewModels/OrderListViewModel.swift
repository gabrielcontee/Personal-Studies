//
//  OrderListViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

class OrderListViewModel: ObservableObject {

    @Published var orders = [OrderViewModel]()

    init() {
        Task {
            await self.fetchOrders()
        }
    }

    func fetchOrders() async {

        do {
            if let allOrders = try await Webservice.getAllOrders() {

                DispatchQueue.main.async {

                    self.orders = allOrders.map(OrderViewModel.init)
                }
            }
        } catch {
            print("order error")
            self.orders = []
        }
    }
}

class OrderViewModel: Identifiable {

    let id = UUID()

    var order: Order

    init(order: Order) {
        self.order = order
    }

    var name: String {
        return self.order.name
    }

    var size: String {
        return self.order.size
    }

    var coffeeName: String {
        return self.order.coffeeName
    }

    var total: Double {
        return self.order.total
    }
}
