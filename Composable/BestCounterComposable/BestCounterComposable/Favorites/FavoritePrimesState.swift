//
//  FavoritePrimesState.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation
import Combine

class FavoritePrimesState: ObservableObject {

    let objectWillChange = ObservableObjectPublisher()

    private var state: AppState

    var favoritePrimes: [Int] {
        get { self.state.favoritePrimes }
        set { self.state.favoritePrimes = newValue }
    }

    var activityFeed: [AppState.Activity] {
        get { self.state.activityFeed }
        set { self.state.activityFeed = newValue }
    }

    init(state: AppState) {

        self.state = state
    }
}

extension FavoritePrimesState {

    func addFavoritePrime() {
        self.favoritePrimes.append(self.state.count)
        self.activityFeed.append(.init(timestamp: Date(),
                                       type: .addedFavoritePrime(self.state.count)))
    }

    func removeFavoritePrime(_ prime: Int) {
        self.favoritePrimes.removeAll(where: { $0 == prime })
        self.activityFeed.append(.init(timestamp: Date(),
                                             type: .removedFavoritePrime(prime)))
    }

    func removeFavoritePrimes(at indexSet: IndexSet) {
        for index in indexSet {
            self.removeFavoritePrime(self.favoritePrimes[index])
        }
    }
}
