//
//  AddCoffeeOrderView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 30/10/2022.
//

import SwiftUI

struct AddCoffeeOrderView: View {

    @ObservedObject private var addCoffeeOrderViewModel = AddCoffeeOrderViewModel()

    @Binding var isPresented: Bool

    var body: some View {

        NavigationView {
            VStack() {
                Form {

                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderViewModel.name)
                    }

                    Section(header: Text("SELECT COFFEE").font(.body)) {

                        ForEach(self.addCoffeeOrderViewModel.coffeeList,
                                id: \.id) { coffee in

                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderViewModel.coffeeName)
                        }
                    }

                    Section(header: Text("SELECT COFFEE").font(.body),
                            footer: OrderTotalView(total: self.addCoffeeOrderViewModel.totalPrice)) {

                        Picker("", selection: self.$addCoffeeOrderViewModel.size) {

                            ForEach(CoffeeSize.allCases, id: \.rawValue) { size in

                                Text(size.rawValue).tag(size.rawValue)
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                    }

                    HStack {
                        Spacer()
                        Button("Place Order") {

                            self.addCoffeeOrderViewModel.placeOrder()
                            self.isPresented = false
                        }
                        .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(16)
                        Spacer()
                    }

                }
            }.navigationTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {

    let coffee: CoffeeViewModel
    @Binding var selection: String

    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 75.0, height: 75.0)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title2)
                .padding([.leading], 16)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }.onTapGesture {

            self.selection = self.coffee.name
        }
    }
}
