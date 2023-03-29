//
//  ContentView.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 13/02/2023.
//

import SwiftUI
import ComposableArchitecture
import FavoritePrimes

struct ContentView: View {

    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(store: self.store)) {
                    Text("Counter View")
                }
                NavigationLink(destination: FavoritePrimesView(store: self.store)) {
                    Text("Favorite primes")
                }
            }.navigationTitle("State management")
        }
    }
}

extension ContentView {

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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialValue: AppState(), reducer: AppReducer.createAppReducer()))
    }
}
