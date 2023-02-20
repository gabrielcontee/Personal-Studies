//
//  ContentView.swift
//  CoreMLSwiftUI
//
//  Created by Gabriel Conte on 15/12/2022.
//

import SwiftUI

struct ContentView: View {

    let images = ["dog", "cat", "mountain", "tree"]
    @State private var selectedImage = ""

    @ObservedObject private var imageDetectionViewModel: ImageDetectionViewModel

    init() {
        let imageDectetionManager = ImageDetectionManager()
        self.imageDetectionViewModel = ImageDetectionViewModel(imageDetector: imageDectetionManager)
    }

    var body: some View {
        NavigationStack {

            VStack {
                ScrollView([.horizontal]) {
                    HStack {
                        ForEach(self.images, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .padding()
                                .onTapGesture {
                                    self.selectedImage = imageName
                                }
                                .border(Color.black,
                                        width: self.selectedImage == imageName ? 10 : 0)
                        }
                    }
                }.padding(.bottom)

                Text(self.imageDetectionViewModel.predictionLabel)
                    .font(.title3)

                Button("Detect") {
                    self.imageDetectionViewModel.detect(name: self.selectedImage)
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(16.0)

            }
            .padding()

            .navigationTitle("Core ML")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
