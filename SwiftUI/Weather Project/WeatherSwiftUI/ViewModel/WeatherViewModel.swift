//
//  WeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {

    private var weatherService: WeatherService

    @Published var weather = Weather()

    var temperature: String {
        guard let temperature = self.weather.temperature?.formatZeros() else { return "" }

        return "Now: \(temperature) °C"
    }

    var humidity: String {
        guard let humidity = self.weather.humidity?.formatZeros() else { return "" }

        return "Humidity: \(humidity)%"
    }

    var minTemperature: String {
        guard let minTemperature = self.weather.minTemperature?.formatZeros() else { return "" }

        return "Min: \(minTemperature) °C"
    }

    var maxTemperature: String {
        guard let maxTemperature = self.weather.maxTemperature?.formatZeros() else { return "" }

        return "Max: \(maxTemperature) °C"
    }

    var cityName: String = ""

    init(weatherService: WeatherService) {

        self.weatherService = weatherService
    }

    func search() async {

        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {

            await self.fetchWeather(by: city)
        }
    }

    private func fetchWeather(by city: String) async {

        do {
            if let weather = try await self.weatherService.getWeather(city: city) {

                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
        } catch {
            self.weather = Weather()
        }
    }
}

extension Double {

    func formatZeros() -> String {

        return String(format: "%.0f", self)
    }
}
