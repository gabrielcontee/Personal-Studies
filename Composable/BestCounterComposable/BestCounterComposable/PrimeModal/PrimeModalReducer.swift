//
//  PrimeModalReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

struct PrimeModalReducer {

    func primeModalReducer(state: inout AppState, action: PrimeModalAction) {

        switch action {

        case .saveFavoritePrimeTapped:
            state.favoritePrimes.append(state.count)

        case .removeFavoritePrimeTapped:
            state.favoritePrimes.removeAll(where: { $0 == state.count })
        }
    }
}
