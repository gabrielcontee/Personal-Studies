//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

enum RequestError: Error {
    case genericError
}

class WeatherService {

    private var apiKey: String {

        if let key = Bundle.main.object(forInfoDictionaryKey: "WeatherAPIKey") as? String {

            return key
        }

        assertionFailure("Missing Weather API key")
        return ""
    }

    private let session = URLSession.shared

    func getWeather(city: String) async throws -> Weather? {

        guard let url = self.weatherURL(city: city) else { return nil }

        let (data, response) = try await self.session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw RequestError.genericError }

        do {
            let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)

            return weatherResponse.main

        } catch { return nil }
    }

    private func weatherURL(city: String) -> URL? {

        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(self.apiKey)")
    }
}
