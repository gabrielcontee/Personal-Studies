//
//  Store.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 19/02/2023.
//

import Foundation

final class Store<Value, Action>: ObservableObject {

    let reducer: (inout Value, Action) -> Void

    @Published private(set) var value: Value

    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {

        self.value = initialValue
        self.reducer = reducer
    }

    func send(_ action: Action) {

        self.reducer(&self.value, action)
    }
}
