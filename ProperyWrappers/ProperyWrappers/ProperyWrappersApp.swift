//
//  ProperyWrappersApp.swift
//  ProperyWrappers
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

@main
struct ProperyWrappersApp: App {

    let propertyWrapperTest = Test()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class Test {

    init() {

        let bankAccount = BankAccount.account()
        print(bankAccount.amount)

        let resource = Resource(city: "New York")
        print(resource.url) // Added %20 in spaces with success!
    }
}
