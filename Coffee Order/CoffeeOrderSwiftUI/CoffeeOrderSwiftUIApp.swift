//
//  CoffeeOrderSwiftUIApp.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import SwiftUI

@main
struct CoffeeOrderSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            OrderViewFactory.mainOrderView()
        }
    }
}
