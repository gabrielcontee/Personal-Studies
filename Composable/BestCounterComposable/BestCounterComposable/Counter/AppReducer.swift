//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation

struct AppReducer {

    static func appReducer(state: inout AppState, action: AppAction) {

        switch action {

        case .counter(.decreaseTapped):
            state.count -= 1
        case .counter(.increaseTapped):
            state.count += 1
        case .primeModal(.saveFavoritePrimeTapped):
            state.favoritePrimes.append(state.count)
            state.activityFeed.append(.init(timestamp: Date(),
                                           type: .addedFavoritePrime(state.count)))
        case .primeModal(.removeFavoritePrimeTapped):
            state.favoritePrimes.removeAll(where: { $0 == state.count })
            state.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(state.count)))
        case let .favorites(.deleteFavoritePrimes(indexSet)):
            for index in indexSet {
                state.favoritePrimes.removeAll(where: { $0 == index })
                state.activityFeed.append(.init(timestamp: Date(),
                                                     type: .removedFavoritePrime(index)))
            }
        }
    }
}
