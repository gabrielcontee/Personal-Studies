//
//  EpisodeView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct EpisodeView: View {

    let episode = Episode(name: "Macbreak weekly", track: "WWDC 2022")

    @State private var isPlaying = false

    var body: some View {

        VStack {

            Text(self.episode.name)
                .font(.title)
                .foregroundColor(self.isPlaying ? .green : .black)

            Text(self.episode.track)
                .foregroundColor(.secondary)

            PlayButton(isPlaying: self.$isPlaying)
        }
    }
}

struct PlayButton: View {

    @Binding var isPlaying: Bool

    var body: some View {

        Button(action: {

            self.isPlaying.toggle()
        }) {
            Text("Play")
        }.padding(12)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
