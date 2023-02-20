//
//  ContentView.swift
//  FormSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var images = ["🗾", "🌆", "🎆", "🌄", "🎇", "🌃"]

    var body: some View {

        NavigationStack {

            Form {
                Section {
                    HStack {
                        Text("Night Mode")
                        Spacer()
                        NavigationLink(destination: NightShiftFormView()) {
                            Text("Always")
                                .foregroundColor(.gray)
                        }.fixedSize()
                    }
                } header: {
                    Text("")
                }

                Section {
                    HStack {
                        Text("Siri suggestions")
                        Spacer()
                        NavigationLink(destination: Text("")) {
                            Text("")
                                .foregroundColor(.gray)
                        }.fixedSize()
                    }
                } header: {
                    Text("Notifications previews will be shown when the phone is locked")
                        .padding(5)
                }

                Section {
                    List {
                        ForEach(self.images, id: \.self) { image in

                            HStack {

                                Text(image)
                                    .font(.largeTitle)
                                Text("Notification")
                            }
                        }
                    }
                } header: {
                    VStack(alignment: .leading) {
                        Text("Choose the notification style")
                            .padding(5)
                        Text("NOTIFICATION STYLE")
                            .padding(5)
                    }
                }
            }
            .navigationTitle("General settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
