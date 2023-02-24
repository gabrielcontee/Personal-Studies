//
//  BestCounterComposableApp.swift
//  BestCounterComposable
//
//  Created by Gabriel Conte on 13/02/2023.
//

import SwiftUI

@main
struct BestCounterComposableApp: App {

    let store = Store<AppState, AppAction>(initialValue: AppState(),
                                           reducer: StoreHelper.with(
                                            AppReducer.createAppReducer(),
                                            StoreHelper.compose(
                                                AppReducer.logging,
                                                AppReducer.activityFeed)
                                           )
    )

    var body: some Scene {
        WindowGroup {
            ContentView(store: self.store)
                .environment(\.colorScheme, .light)
        }
    }
}
