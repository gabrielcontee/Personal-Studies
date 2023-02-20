//
//  ContentView.swift
//  GesturesSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

struct ContentView: View {

    @State private var cardTapped: Bool = false
    @State private var cardDragState = CGSize.zero
    @State private var cardRotateState: Double = 0.0

    var body: some View {

        CardView(tapped: self.cardTapped)
            .animation(.spring(), value: self.cardDragState.height)
            .animation(.default, value: self.cardTapped)
            .offset(y: self.cardDragState.height)
            .rotationEffect(Angle(degrees: self.cardRotateState))
            .gesture(DragGesture()
                .onChanged { value in

                    self.cardDragState = value.translation
                }
                .onEnded { _ in

                    self.cardDragState = CGSize.zero
                })
            .gesture(TapGesture(count: 1)
                .onEnded {
                    self.cardTapped.toggle()
                })
            .gesture(RotationGesture()
                .onChanged({ value in
                    self.cardRotateState = value.degrees
                })
                    .onEnded({ value in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.cardRotateState = 0.0
                        }
                    })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
