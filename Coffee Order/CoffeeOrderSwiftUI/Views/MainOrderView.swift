//
//  MainOrderView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 15/10/2022.
//

import SwiftUI

struct MainOrderView: View {

    @ObservedObject private var orderListViewModel = OrderListViewModel()

    @State private var isShowingModal: Bool = false

    init(orderListViewModel: OrderListViewModel) {
        self.orderListViewModel = orderListViewModel
    }

    var body: some View {

        NavigationStack {
            OrderListView(orders: self.orderListViewModel.orders)

                .navigationTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: self.reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.black)
                }, trailing: Button(action: self.showAddCoffeeOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                })

                .sheet(isPresented: self.$isShowingModal, onDismiss: {
                    self.reloadOrders()
                }) {
                    AddCoffeeOrderView(isPresented: self.$isShowingModal)
                }
        }
    }

    private func reloadOrders() {
        Task {
            await self.orderListViewModel.fetchOrders()
        }
    }

    private func showAddCoffeeOrderView() {
        self.isShowingModal = true
    }
}

struct MainOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MainOrderView(orderListViewModel: OrderListViewModel())
    }
}
