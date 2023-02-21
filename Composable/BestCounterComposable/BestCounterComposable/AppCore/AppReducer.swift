//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation

struct AppReducer {

    static func combine<Value, Action>(
        _ reducers: (inout Value, Action) -> Void... // ... transforms it into an Array
    ) -> (inout Value, Action) -> Void {
        return { value, action in
            for reducer in reducers {
                reducer(&value, action)
            }
        }
    }

    static func pullback<LocalValue, GlobalValue, Action>(
        _ reducer: @escaping (inout LocalValue, Action) -> Void,
        value: WritableKeyPath<GlobalValue, LocalValue>
    ) -> (inout GlobalValue, Action) -> Void {

        return { globalValue, action in
            reducer(&globalValue[keyPath: value], action)
        }
    }

    static func createAppReducer() -> (inout AppState, AppAction) -> Void {
        let reducersCombined = Self.combine(Self.pullback(CounterReducer.counterReducer,
                                                          value: \.count),
                                            PrimeModalReducer.primeModalReducer,
                                            Self.pullback(FavoritePrimeReducer.favoritePrimeReducer,
                                                          value: \.favoritePrimeState))

        let appReducer = Self.pullback(reducersCombined, value: \.self)

        return appReducer
    }
}

