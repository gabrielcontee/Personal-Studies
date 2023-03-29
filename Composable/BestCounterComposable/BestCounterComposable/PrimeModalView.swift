//
//  IsPrimeModalView.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 18/02/2023.
//

import SwiftUI
import ComposableArchitecture

struct PrimeModalView: View {

    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            if self.isPrime(self.store.value.count) {
                Text("\(self.store.value.count) is prime! 🎉")

                if self.store.value.favoritePrimes.contains(self.store.value.count) {
                    Button {
                        self.store.send(.primeModal(.removeFavoritePrimeTapped))
                    } label: {
                        Text("Remove from favorite primes")
                    }
                } else {
                    Button {
                        self.store.send(.primeModal(.saveFavoritePrimeTapped))
                    } label: {
                        Text("Save to favorite primes")
                    }
                }
            } else {
                Text("\(self.store.value.count) is not prime 😭")
            }
        }
    }

    private func isPrime(_ number: Int) -> Bool {

        if number <= 1 { return false }
        if number <= 3 { return true }

        for index in 2...Int(sqrtf(Float(number))) {
            if number % index == 0 { return false }
        }

        return true
    }
}

struct IsPrimeModalView_Previews: PreviewProvider {
    static var previews: some View {
        PrimeModalView(store: Store(initialValue: AppState(),
                                      reducer: AppReducer.createAppReducer()))
    }
}
