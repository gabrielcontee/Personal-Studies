//
//  Hike.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import Foundation

struct Hike: Identifiable {

    let id = UUID()
    let name: String
    let imageURL: String
    let miles: Double
    let isNice: Bool
}

extension Hike {

    static func all() -> [Hike] {

        return [
            Hike(name: "Salmon", imageURL: "schladming", miles: 6, isNice: true),
            Hike(name: "Tom", imageURL: "verticals", miles: 5.8, isNice: true),
            Hike(name: "Falls", imageURL: "merged", miles: 5, isNice: false)
        ]
    }
}
