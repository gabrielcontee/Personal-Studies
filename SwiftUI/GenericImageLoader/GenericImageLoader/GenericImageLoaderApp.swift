//
//  GenericImageLoaderApp.swift
//  GenericImageLoader
//
//  Created by Gabriel Conte on 17/11/2022.
//

import SwiftUI

@main
struct GenericImageLoaderApp: App {
    var body: some Scene {
        WindowGroup {
            RemoteImageView(source: "https://www.livingoutlau.com/wp-content/uploads/2020/05/Featued-Tokyo-At-Night-min.jpg")
        }
    }
}
