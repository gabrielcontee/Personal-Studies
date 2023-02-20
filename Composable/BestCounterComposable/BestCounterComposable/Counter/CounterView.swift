//
//  CounterView.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 18/02/2023.
//

import SwiftUI

struct CounterView: View {

    @ObservedObject var store: Store<AppState, AppAction>

    @State var isPrimeModalShown = false
    @State var isAlertNthPrimeShown = false
    @State var isAlertNthPrimeDisabled = false
    @State var alertNthPrime: Int = 0

    var body: some View {
        VStack {
            HStack {
                Button {
                    self.store.send(.counter(.decreaseTapped))
                } label: {
                    Text("-")
                }
                Text("\(self.store.value.count)")
                Button {
                    self.store.send(.counter(.increaseTapped))
                } label: {
                    Text("+")
                }
            }
            Button {
                self.isPrimeModalShown = true
            } label: {
                Text("Is this \(self.ordinal(self.store.value.count)) prime?")
            }
            Button {
                Task {
                    await self.simulatePrimeCalculation()
                }
            } label: {
                Text("(FAKE REQUEST) What is the \(self.ordinal(self.store.value.count)) prime?")
            }.disabled(self.isAlertNthPrimeDisabled)
        }.font(.title)
            .navigationBarTitle("Counter Demo")
            .sheet(isPresented: self.$isPrimeModalShown,
                   onDismiss: {
                self.isPrimeModalShown = false
            }) {
                IsPrimeModalView(store: self.store)
            }
            .alert(Text("The \(self.ordinal(self.store.value.count)) prime is \(self.alertNthPrime)"),
                   isPresented: self.$isAlertNthPrimeShown,
                   actions: { })
    }

    private func ordinal(_ number: Int) -> String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: number) ?? ""
    }

    private func simulatePrimeCalculation() async {

        self.isAlertNthPrimeDisabled = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {

            self.alertNthPrime = 12345
            self.isAlertNthPrimeShown = true
            self.isAlertNthPrimeDisabled = false
        })
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(store: Store(initialValue: AppState(),
                                 reducer: AppReducer.appReducer))
    }
}
