//
//  ContentView.swift
//  ModalsSwiftUI
//
//  Created by Gabriel Conte on 12/12/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var showModal = false
    @State private var selectedFlag = ""
    @State private var country = ""
    @State private var flagViewModel = FlagViewModel()

    private let flags: [String] = ["🇦🇱", "🏳️‍⚧️", "🇧🇭", "🇦🇶", "🇹🇩", "🇭🇷"]

    var body: some View {

        List {

            Text(self.flagViewModel.country)

            ForEach(self.flags, id: \.self) { flag in

                HStack {
                    Text(flag)
                        .font(.system(size: 100))
                    Spacer()

                }.onTapGesture {
                    self.flagViewModel.flag = flag
                    self.flagViewModel.showModal.toggle()
                }
            }
        }.sheet(isPresented: self.$flagViewModel.showModal) {
            FlagDetailView(flagViewModel: self.$flagViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
