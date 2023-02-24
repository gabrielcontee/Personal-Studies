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
        self.reducer = reducer
        self.value = initialValue
    }

    func send(_ action: Action) {
        self.reducer(&self.value, action)
    }
}

enum StoreHelper {

    static func combine<Value, Action>(
        _ reducers: (inout Value, Action) -> Void... // ... transforms it into an Array
    ) -> (inout Value, Action) -> Void {
        return { value, action in
            for reducer in reducers {
                reducer(&value, action)
            }
        }
    }

    static func compose<A, B, C>(
        _ f: @escaping (B) -> C,
        _ g: @escaping (A) -> B
    ) -> (A) -> C {

        return { (a: A) -> C in
            f(g(a))
        }
    }

    static func with<A, B>(_ a: A, _ f: (A) throws -> B) rethrows -> B {
        return try f(a)
    }
}
