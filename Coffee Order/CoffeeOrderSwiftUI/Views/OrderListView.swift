//
//  OrderListView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import SwiftUI

struct OrderListView: View {

    let orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {
        List {

            ForEach(self.orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)

                    VStack {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)

                        HStack {
                            Text(order.coffeeName)
                                .padding(EdgeInsets(top: 10,
                                                    leading: 10,
                                                    bottom: 10,
                                                    trailing: 10))
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)

                            Text(order.size)
                                .padding(EdgeInsets(top: 10,
                                                    leading: 10,
                                                    bottom: 10,
                                                    trailing: 10))
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderViewFactory.orderListView()
    }
}
