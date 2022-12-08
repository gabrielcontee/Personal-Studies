//
//  CardView.swift
//  GesturesSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

struct CardView: View {

    let tapped: Bool

    @State private var photoScale: CGFloat = 1.0

    var body: some View {

        VStack {

            Image("dog")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(self.photoScale)
                .animation(.easeIn, value: self.photoScale)
                .gesture(MagnificationGesture()
                    .onChanged({ value in

                        self.photoScale = value.magnitude
                    })
                        .onEnded({_ in
                            self.photoScale = 1.0
                        })
                )

            Text("Card")
                .font(.title)
                .foregroundColor(.white)

        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity)
        .background(tapped ? .purple : .orange)
        .cornerRadius(30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(tapped: false)
    }
}
