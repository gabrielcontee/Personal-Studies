//
//  OrderViewFactory.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 15/10/2022.
//

import Foundation
import SwiftUI

final class OrderViewFactory {

    static func orderListView() -> some View {

        return OrderListView(orders: [OrderViewModel(order: Order(name: "John",
                                                                  size: "Medium",
                                                                  coffeeName: "Regular",
                                                                  total: 15.0))])
    }

    static func mainOrderView() -> some View {

        let orderListViewModel = OrderListViewModel()

        return MainOrderView(orderListViewModel: orderListViewModel)
    }
}
