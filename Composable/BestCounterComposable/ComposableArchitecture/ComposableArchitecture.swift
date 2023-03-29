//
//  ComposableArchitecture.swift
//  ComposableArchitecture
//
//  Created by Gabriel Conte on 27/02/2023.
//

import Foundation

public final class Store<Value, Action>: ObservableObject {

    private let reducer: (inout Value, Action) -> Void

    @Published public private(set) var value: Value

    public init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        self.reducer = reducer
        self.value = initialValue
    }

    public func send(_ action: Action) {
        self.reducer(&self.value, action)
    }
}

public enum StoreHelper {

    public static func combine<Value, Action>(
        _ reducers: (inout Value, Action) -> Void... // ... transforms it into an Array
    ) -> (inout Value, Action) -> Void {
        return { value, action in
            for reducer in reducers {
                reducer(&value, action)
            }
        }
    }

    public static func compose<A, B, C>(
        _ f: @escaping (B) -> C,
        _ g: @escaping (A) -> B
    ) -> (A) -> C {

        return { (a: A) -> C in
            f(g(a))
        }
    }

    public static func with<A, B>(_ a: A, _ f: (A) throws -> B) rethrows -> B {
        return try f(a)
    }

    public static func pullback<LocalValue, GlobalValue, LocalAction, GlobalAction>(
        _ reducer: @escaping (inout LocalValue, LocalAction) -> Void,
        value: WritableKeyPath<GlobalValue, LocalValue>,
        action: WritableKeyPath<GlobalAction, LocalAction?>
    ) -> (inout GlobalValue, GlobalAction) -> Void {
        return { globalValue, globalAction in
            guard let localAction = globalAction[keyPath: action] else { return }
            reducer(&globalValue[keyPath: value], localAction)
        }
    }

    // Logging reducer
    public static func logging<Value, Action>(
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
}
