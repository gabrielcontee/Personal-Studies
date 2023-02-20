//
//  CoffeeViewModel.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 30/10/2022.
//

import Foundation

class CoffeeListViewModel {

    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {

    var coffee: Coffee

    var id: UUID { return self.coffee.id }
    var name: String { return self.coffee.name }
    var imageURL: String { return self.coffee.imageURL }
    var price: Double { return self.coffee.price }

}
