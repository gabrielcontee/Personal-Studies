//
//  HikeDetailView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct HikeDetailView: View {

    let hike: Hike

    @State private var zoomed: Bool = false

    var body: some View {
        VStack {

            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                }

            Text(hike.name)
            Text(String(format: "%.2f", hike.miles) + " miles")

        }.navigationTitle(hike.name)
         .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetailView(hike: Hike(name: "angel", imageURL: "schladming", miles: 10, isNice: true))
    }
}
