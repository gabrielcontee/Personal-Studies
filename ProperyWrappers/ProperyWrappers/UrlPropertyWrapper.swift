//
//  UrlPropertyWrapper.swift
//  ProperyWrappers
//
//  Created by Gabriel Conte on 08/12/2022.
//

import Foundation

@propertyWrapper
class SafeUrlEncode {

    private(set) var safeUrl: String = ""

    var wrappedValue: String {
        get { safeUrl }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.safeUrl = url
            }
        }
    }
}

struct Resource {

    @SafeUrlEncode
    var city: String

    var url: String {
        return "https://apiexample/weather?=\(city)" // Space in the middle
    }

    init(city: String) {
        self.city = city
    }
}
