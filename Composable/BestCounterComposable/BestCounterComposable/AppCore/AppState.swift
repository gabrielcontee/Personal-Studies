//
//  AppState.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 18/02/2023.
//

import Foundation
import ComposableArchitecture
import PrimeModal

struct AppState {

    var count = 0
    var favoritePrimes: [Int] = []
    var loggedInUser: User?
    var activityFeed: [Activity] = []

    struct User {

        let id: Int
        let name: String
        let bio: String
    }

    struct Activity {

        let timestamp: Date
        let type: ActivityType

        enum ActivityType {
            case addedFavoritePrime(Int)
            case removedFavoritePrime(Int)
        }
    }
}

// Needed to expose PrimeModalState to the keypath
extension AppState {
    var primeModal: PrimeModalState {
        get {
            PrimeModalState(
                count: self.count,
                favoritePrimes: self.favoritePrimes
            )
        }
        set {
            self.count = newValue.count
            self.favoritePrimes = newValue.favoritePrimes
        }
    }
}
