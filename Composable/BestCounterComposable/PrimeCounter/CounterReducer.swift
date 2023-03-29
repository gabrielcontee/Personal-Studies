//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

public struct CounterReducer {

    public static func counterReducer(state: inout Int, action: CounterAction) {

        switch action {

        case .decreaseTapped:
            state -= 1
        case .increaseTapped:
            state += 1
        }
    }
}
