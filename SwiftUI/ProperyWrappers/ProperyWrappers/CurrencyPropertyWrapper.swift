//
//  CurrencyPropertyWrapper.swift
//  ProperyWrappers
//
//  Created by Gabriel Conte on 08/12/2022.
//

import Foundation

@propertyWrapper
class Currency {

    private(set) var valueInEuro: String = ""

    var wrappedValue: String {
        get { return valueInEuro }
        set {
            valueInEuro = "€\(newValue)"
        }
    }
}


struct BankAccount {

    @Currency
    var amount: String

    init(amount: String) {
        self.amount = amount
    }
}

extension BankAccount {

    static func account() -> BankAccount {

        return BankAccount(amount: "1250")
    }
}
