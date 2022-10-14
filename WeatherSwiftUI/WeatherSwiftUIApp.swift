//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherFactory.weatherView()
        }
    }
}
