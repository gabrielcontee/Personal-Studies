//
//  AppState.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 18/02/2023.
//

import Foundation
import Combine

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
