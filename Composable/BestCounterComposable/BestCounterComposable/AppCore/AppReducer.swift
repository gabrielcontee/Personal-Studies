//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation

struct AppReducer {

    static func createAppReducer() -> (inout AppState, AppAction) -> Void {

        let reducersCombined: (inout AppState, AppAction) -> Void = StoreHelper.combine(
            self.pullback(CounterReducer().counterReducer,
                          value: \.count,
                          action: \.counter),
            self.pullback(PrimeModalReducer().primeModalReducer,
                          value: \.self,
                          action: \.primeModal),
            self.pullback(FavoritePrimeReducer().favoritePrimeReducer,
                          value: \.favoritePrimes,
                          action: \.favoritePrimes)
        )

        let appReducer = self.pullback(reducersCombined,
                                       value: \.self,
                                       action: \.self)

        return appReducer
    }
}

extension AppReducer {

    // Mark: Activity Feed Reducer
    static func activityFeed(
        _ reducer: @escaping (inout AppState, AppAction) -> Void
    ) -> (inout AppState, AppAction) -> Void {

        return { state, action in
            switch action {
            case .counter:
                break

            case .primeModal(.removeFavoritePrimeTapped):
                state.activityFeed.append(.init(timestamp: Date(),
                                                type: .removedFavoritePrime(state.count)))

            case .primeModal(.saveFavoritePrimeTapped):
                state.activityFeed.append(.init(timestamp: Date(),
                                                type: .addedFavoritePrime(state.count)))

            case let .favoritePrimes(.deleteFavoritePrimes(indexSet)):
                for index in indexSet {
                    let prime = state.favoritePrimes[index]
                    state.activityFeed.append(.init(timestamp: Date(),
                                                    type: .removedFavoritePrime(prime)))
                }
            }

            reducer(&state, action)
        }
    }

    static func logging<Value, Action>(
        _ reducer: @escaping (inout Value, Action) -> Void
    ) -> (inout Value, Action) -> Void {
        return { value, action in
            reducer(&value, action)
            print("Action: \(action)")
            print("Value:")
            dump(value)
            print("---")
        }
    }

    static func pullback<LocalValue, GlobalValue, LocalAction, GlobalAction>(
        _ reducer: @escaping (inout LocalValue, LocalAction) -> Void,
        value: WritableKeyPath<GlobalValue, LocalValue>,
        action: WritableKeyPath<GlobalAction, LocalAction?>
    ) -> (inout GlobalValue, GlobalAction) -> Void {
        return { globalValue, globalAction in
            guard let localAction = globalAction[keyPath: action] else { return }
            reducer(&globalValue[keyPath: value], localAction)
        }
    }
}

