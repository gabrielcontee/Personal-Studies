//
//  Weather.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

struct Weather: Decodable, Identifiable {

    let id: UUID = UUID()
    var temperature: Double?
    var minTemperature: Double?
    var maxTemperature: Double?
    var humidity: Double?

    private enum CodingKeys: String, CodingKey {

        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity
    }
}
