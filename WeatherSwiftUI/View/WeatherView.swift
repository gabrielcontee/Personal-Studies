//
//  WeatherView.swift
//  WeatherSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import SwiftUI

struct WeatherView: View {

    @ObservedObject var weatherViewModel: WeatherViewModel

    init(weatherViewModel: WeatherViewModel) {
        self.weatherViewModel = weatherViewModel
    }

    var body: some View {
        VStack(alignment: .center) {

            WeatherTextField(weatherViewModel: self.weatherViewModel)

            Text(self.weatherViewModel.temperature)
                .padding()
            Text(self.weatherViewModel.minTemperature)
                .padding()
            Text(self.weatherViewModel.maxTemperature)
                .padding()
            Text(self.weatherViewModel.humidity)
                .padding()
        }
    }
}

struct WeatherTextField: View {

    @ObservedObject var weatherViewModel: WeatherViewModel

    var body: some View {
        TextField("City name", text: self.$weatherViewModel.cityName) {

            Task {
                await self.weatherViewModel.search()
            }
        }.font(.custom("Arial", size: 24))
            .textFieldStyle(.roundedBorder)
            .padding()
            .fixedSize()
            .disableAutocorrection(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherFactory.weatherView()
    }
}
