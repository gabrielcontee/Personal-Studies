//
//  UserSettings.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {

    @Published var score: Int = 0
}
