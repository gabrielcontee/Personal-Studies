//
//  PrimeModalState.swift
//  PrimeModal
//
//  Created by Gabriel Conte on 27/02/2023.
//

import Foundation

// This is needed to be a connection between the main module and the PrimeModal module
public struct PrimeModalState {

    public var count: Int
    public var favoritePrimes: [Int]

    public init(count: Int,
                favoritePrimes: [Int]) {
        self.count = count
        self.favoritePrimes = favoritePrimes
    }
}
