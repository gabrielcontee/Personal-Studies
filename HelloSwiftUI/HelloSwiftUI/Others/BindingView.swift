//
//  BindingView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct BindingView: View {

    @State var name: String = ""

    private func printName() {
        print(self.name)
    }

    var body: some View {

        VStack {
            Text(name)
            TextField("Enter name", text: $name)
                .padding(12)
            Button(action: self.printName) {
                Text("Show name value")
            }
        }

    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
