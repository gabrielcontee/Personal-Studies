//
//  CounterReducer.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

struct CounterReducer {

    static func counterReducer(state: inout Int, action: AppAction) {

        switch action {

        case .counter(.decreaseTapped):
            state -= 1
        case .counter(.increaseTapped):
            state += 1

        default: break
        }
    }
}
