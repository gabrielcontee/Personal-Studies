//
//  Webservice.swift
//  AppleStocksSwiftUI
//
//  Created by Gabriel Conte on 26/12/2022.
//

import Foundation

class Webservice: ObservableObject {

    private let stocksUrl = "https://island-bramble.glitch.me/stocks"

    @Published var status: LoaderStatus = .inProgress

    enum LoaderStatus {
        case inProgress
        case fetched
    }

    enum LoaderError: Error {
        case genericError
    }

    //"https://island-bramble.glitch.me/top-news"

    public func fetchStocks() async throws -> [Stock]? {

        guard let url = URL(string: self.stocksUrl) else { return nil }

        let request = URLRequest(url: url)

        let stocksData = try await self.fetch(request)

        guard let stocks = try? JSONDecoder().decode([Stock].self, from: stocksData) else { return nil }

        return stocks
    }

    private func fetch(_ urlRequest: URLRequest) async throws -> Data {

        DispatchQueue.main.async {
            self.status = .inProgress
        }

        let task: Task<Data, Error> = Task {

            let (data, _) = try await URLSession.shared.data(for: urlRequest)

            return data
        }

        let data = try await task.value

        DispatchQueue.main.async {
            self.status = .fetched
        }

        return data
    }
}
