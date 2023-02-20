//
//  FavoritePrimesView.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 18/02/2023.
//

import SwiftUI

struct FavoritePrimesView: View {

    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        List {
            ForEach(self.store.value.favoritePrimes,
                    id: \.self,
                    content: { prime in

                Text("\(prime)")
            })
            .onDelete { indexSet in
                self.store.send(.primeModal(.removeFavoritePrimeTapped))
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Favorite Primes")
        }
    }
}

//struct FavoritePrimesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritePrimesView(store: Store(initialValue: FavoritePrimesState(state: AppState()),
//                                        reducer: AppReducer.appReducer) )
//    }
//}
