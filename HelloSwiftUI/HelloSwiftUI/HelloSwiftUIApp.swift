//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {

    init() {

        self.setupTheme()
    }

    private func setupTheme() {

        // do all the delegate stuff
    }

    var body: some Scene {
        WindowGroup {
            let userSettings = UserSettings()
            ControlView().environmentObject(userSettings)
        }
    }
}
