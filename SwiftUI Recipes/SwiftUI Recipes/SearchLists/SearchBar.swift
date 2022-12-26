//
//  SearchBar.swift
//  SwiftUI Recipes
//
//  Created by Gabriel Conte on 26/12/2022.
//

import Foundation
import SwiftUI

struct SearchBarView: UIViewRepresentable {

    typealias UIViewType = UISearchBar

    @Binding var text: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {

            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            text = searchText
        }
    }

    func makeCoordinator() -> SearchBarView.Coordinator {

        return Coordinator(text: self.$text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBarView>) -> UISearchBar {

        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {

        uiView.text = self.text
    }
}
