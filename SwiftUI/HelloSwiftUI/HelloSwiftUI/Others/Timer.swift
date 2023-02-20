//
//  Timer.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import Foundation
import SwiftUI
import Combine

class FancyTimer: ObservableObject {

    @Published var value: Int = 0

    init() {

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

            self.value += 1
        }
    }

    func addMore() {

        self.value += 2
    }
}
