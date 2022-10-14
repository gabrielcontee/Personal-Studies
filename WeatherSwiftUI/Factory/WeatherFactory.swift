//
//  WeatherFactory.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation
import SwiftUI

final class WeatherFactory {

    static func weatherView() -> some View {

        let weatherService = WeatherService()
        let weatherViewModel = WeatherViewModel(weatherService: weatherService)

        return WeatherView(weatherViewModel: weatherViewModel)
    }
}
