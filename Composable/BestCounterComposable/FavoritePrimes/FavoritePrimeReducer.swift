//
//  FavoritePrimeReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

public struct FavoritePrimeReducer {

    public static func favoritePrimeReducer(state: inout [Int], action: FavoritePrimesAction) {

        switch action {

        case let .deleteFavoritePrimes(indexSet):
            for index in indexSet {
                state.removeAll(where: { $0 == index })
            }
        }
    }
}
