//
//  Report.swift
//  ChartsSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import Foundation

struct Report: Hashable {

    let year: String
    let revenue: Double
}

extension Report {

    static func all() -> [Report] {

        return [Report(year: "2020", revenue: 5000),
                Report(year: "2021", revenue: 11000),
                Report(year: "2022", revenue: 17000)]
    }
}
