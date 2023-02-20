//
//  SearchListView.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 26/12/2022.
//

import SwiftUI

struct SearchListView: View {

    let names = ["Adam", "Steve", "Wonder", "Eleanor", "Smith", "Testenildo", "Gabriel", "Samara", "Eduardo", "Adonis"]

    @State private var searchTerm: String = ""

    var body: some View {

        VStack {
            SearchBarView(text: self.$searchTerm)

            List(self.names.filter { self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)

            }, id: \.self) { name in

                Text(name)
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
