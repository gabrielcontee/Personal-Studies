//
//  PrimeModalReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

struct PrimeModalReducer {

    static func primeModalReducer(state: inout AppState, action: AppAction) {

        switch action {

        case .primeModal(.saveFavoritePrimeTapped):
            state.favoritePrimes.append(state.count)
            state.activityFeed.append(.init(timestamp: Date(),
                                           type: .addedFavoritePrime(state.count)))
        case .primeModal(.removeFavoritePrimeTapped):
            state.favoritePrimes.removeAll(where: { $0 == state.count })
            state.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(state.count)))

        default: break
        }
    }
}
