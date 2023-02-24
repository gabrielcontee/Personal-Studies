//
//  Wolfram.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 21/02/2023.
//

import Foundation

struct WolframAlphaResult: Decodable {

    public let queryresult: QueryResult

    struct QueryResult: Decodable {
        let pods: [Pod]

        struct Pod: Decodable {
            let primary: Bool?
            let subpods: [SubPod]

            struct SubPod: Decodable {
                let plaintext: String
            }
        }
    }
}

struct WolframAlphaFetcher {

    private static var wolframAlphaApiKey = "9L6AQL-QGEYPJQ3RP"

    private static func wolframAlpha(query: String) async throws -> [WolframAlphaResult]? {

        var components = URLComponents(string: "https://api.wolframalpha.com/v2/query")!

        components.queryItems = [
            URLQueryItem(name: "input", value: query),
            URLQueryItem(name: "format", value: "plaintext"),
            URLQueryItem(name: "output", value: "JSON"),
            URLQueryItem(name: "appid", value: wolframAlphaApiKey),
        ]

        let request = URLRequest(url: components.url!)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw WolframError.generic }

        do {
            return try JSONDecoder().decode([WolframAlphaResult].self, from: data)
        } catch { return nil }
    }

    static func nthPrime(_ n: Int) async throws -> Int {

        var number: Int?

        let result = try await self.wolframAlpha(query: "prime \(n)")

        number = result?.compactMap {
            $0.queryresult
                .pods
                .first(where: { $0.primary == .some(true) })?
                .subpods
                .first?
                .plaintext
        }.first?
         .flatMap(Int.init)

        guard let primeNumber = number else {
            throw WolframError.prime
        }

        return primeNumber
    }

    enum WolframError: Error {
        case prime
        case generic
    }
}
