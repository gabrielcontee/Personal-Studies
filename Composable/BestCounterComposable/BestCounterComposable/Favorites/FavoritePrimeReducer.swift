//
//  FavoritePrimeReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

struct FavoritePrimeReducer {

    static func favoritePrimeReducer(state: inout FavoritePrimesState, action: AppAction) {

        switch action {

        case let .favorites(.deleteFavoritePrimes(indexSet)):
            for index in indexSet {
                state.favoritePrimes.removeAll(where: { $0 == index })
                state.activityFeed.append(.init(timestamp: Date(),
                                                     type: .removedFavoritePrime(index)))
            }

        default: break
        }
    }
}

extension AppState {

    var favoritePrimeState: FavoritePrimesState {

        get {
            FavoritePrimesState(favoritePrimes: self.favoritePrimes,
                                activityFeed: self.activityFeed)
        } set {
            self.favoritePrimes = newValue.favoritePrimes
            self.activityFeed = newValue.activityFeed
        }
    }
}
