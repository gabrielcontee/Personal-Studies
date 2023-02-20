//
//  FancyScoreView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct FancyScoreView: View {

    @EnvironmentObject var userSettings: UserSettings

    var body: some View {

        VStack {
            Text("\(self.userSettings.score)")
                .font(.largeTitle)

            Button("Increase Score") {

                self.userSettings.score += 1
            }.padding()
                .background(Color.green)
        }.padding()
            .background(Color.orange)

    }
}

struct FancyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        FancyScoreView()
    }
}
