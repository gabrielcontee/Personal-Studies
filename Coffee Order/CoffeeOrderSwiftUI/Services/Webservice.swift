//
//  Webservice.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 14/10/2022.
//

import Foundation

enum RequestError: Error {
    case genericError
}

enum HttpMethod {

    static let post = "POST"
    static let get = "GET"
}

enum HeaderValue {

    static let jsonContentType = "application/json"
}

enum HeaderKey {

    static let contentType = "Content-Type"
}

enum StatusCode {

    static let success = 200
}

class Webservice {

    private static var baseURL: String { "https://island-bramble.glitch.me" }

    private static let session = URLSession.shared

    static func createOrder(_ order: Order) async throws -> CreateOrderResponse? {

        guard let url = URL(string: Self.baseURL + "/orders") else { return nil }

        var request = URLRequest(url: url)

        request.httpMethod = HttpMethod.post
        request.addValue(HeaderValue.jsonContentType, forHTTPHeaderField: HeaderKey.contentType)

        do {
            let payload = try JSONEncoder().encode(order)
            let (data, response) = try await session.upload(for: request, from: payload)

            guard (response as? HTTPURLResponse)?.statusCode == StatusCode.success else {

                print(RequestError.genericError) // handle error here
                return nil
            }

            let createOrderResponse = try JSONDecoder().decode(CreateOrderResponse.self, from: data)

            return createOrderResponse

        } catch {

            print(RequestError.genericError) // handle error here
            return nil
        }
    }

    static func getAllOrders() async throws -> [Order]? {

        guard let url = URL(string: Self.baseURL + "/orders") else { return nil }

        let (data, response) = try await Self.session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else { throw RequestError.genericError }

        do {
            let orders = try JSONDecoder().decode([Order].self, from: data)

            return orders

        } catch { return nil }
    }
}
