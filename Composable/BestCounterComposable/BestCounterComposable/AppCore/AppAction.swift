//
//  AppAction.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 20/02/2023.
//

import Foundation

enum AppAction {

    case counter(CounterAction)
    case primeModal(PrimeModalAction)
    case favorites(FavoritePrimesAction)
}
