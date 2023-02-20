//
//  TimerView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct TimerView: View {

    @ObservedObject var fancyTimer = FancyTimer()

    var body: some View {

        VStack {

            Text("timer: \(self.fancyTimer.value)")
                .font(.title)

            Button(action: fancyTimer.addMore) {
                Text("add!!!")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }

            Button("test") {

                self.fancyTimer.value += 29
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
