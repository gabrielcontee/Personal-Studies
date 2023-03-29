//
//  PrimeModalReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

public struct PrimeModalReducer {

    public static func primeModalReducer(state: inout PrimeModalState, action: PrimeModalAction) {

        switch action {

        case .saveFavoritePrimeTapped:
            state.favoritePrimes.append(state.count)

        case .removeFavoritePrimeTapped:
            state.favoritePrimes.removeAll(where: { $0 == state.count })
        }
    }
}
