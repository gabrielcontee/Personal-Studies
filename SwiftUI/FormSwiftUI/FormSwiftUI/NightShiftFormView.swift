//
//  NightShiftFormView.swift
//  FormSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

struct NightShiftFormView: View {

    @State private var scheduled: Bool = false
    @State private var manuallyEnabledUntilTomorrow: Bool = false
    @State private var colorTemperature: CGFloat = 0.0

    var body: some View {

        NavigationStack {
            Form {
                Section {
                    Text("Changes your device display color")
                        .padding(5)
                        .lineLimit(nil)
                } header: {
                    Text("Night shift mode")
                }


                Toggle(isOn: $scheduled) {
                    Text("Scheduled")
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text("From")
                        Text("To")
                    }

                    Spacer()

                    NavigationLink(destination: Text("Scheduled settings")) {

                        VStack(alignment: .trailing) {
                            Text("Sunset")
                                .foregroundColor(.blue)
                            Text("Sunrise")
                                .foregroundColor(.blue)
                        }
                    }.fixedSize()
                }

                Section {
                    Toggle(isOn: $manuallyEnabledUntilTomorrow) {
                        Text("Manually enabled until tomorrow")
                    }
                } header: {
                    Text("Hello")
                        .padding(5)
                }

                Section {
                    HStack {
                        Text("Less warm")
                        Slider(value: $colorTemperature)
                        Text("More warm")
                    }
                } header: {
                    Text("Color temperatur")
                        .padding(5)
                }

            }
            .navigationTitle(Text("Settings"))
        }

    }
}

struct NightShiftFormView_Previews: PreviewProvider {
    static var previews: some View {
        NightShiftFormView()
    }
}

