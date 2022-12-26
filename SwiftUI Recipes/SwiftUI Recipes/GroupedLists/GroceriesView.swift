//
//  ContentView.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 16/12/2022.
//

import SwiftUI

struct GroceriesView: View {

    private var groceryCategories = GroceryCategory.all()

    var body: some View {

        List(self.groceryCategories, id: \.title) { category in

            Section {
                ForEach(category.groceryItems, id: \.title) { item in
                    Text(item.title)
                }
            } header: {
                Text(category.title)
                    .font(.title3)
            }
        }.listStyle(.insetGrouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesView()
    }
}
