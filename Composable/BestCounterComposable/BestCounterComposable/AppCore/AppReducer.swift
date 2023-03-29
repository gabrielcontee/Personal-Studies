//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation
import ComposableArchitecture
import PrimeCounter
import FavoritePrimes
import PrimeModal

struct AppReducer {
    
    static func createAppReducer() -> (inout AppState, AppAction) -> Void {
        
        let reducersCombined: (inout AppState, AppAction) -> Void = StoreHelper.combine(
            StoreHelper.pullback(CounterReducer.counterReducer,
                                 value: \.count,
                                 action: \.counter),
            StoreHelper.pullback(PrimeModalReducer.primeModalReducer,
                                 value: \.primeModal,
                                 action: \.primeModal),
            StoreHelper.pullback(FavoritePrimeReducer.favoritePrimeReducer,
                                 value: \.favoritePrimes,
                                 action: \.favoritePrimes)
        )
        
        let appReducer = StoreHelper.pullback(reducersCombined,
                                              value: \.self,
                                              action: \.self)
        
        return appReducer
    }
}
