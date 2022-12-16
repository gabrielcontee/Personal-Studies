//
//  ImageDetectionViewModel.swift
//  CoreMLSwiftUI
//
//  Created by Gabriel Conte on 15/12/2022.
//

import Foundation
import SwiftUI

class ImageDetectionViewModel: ObservableObject {

    var name = ""
    let imageDetector: ImageDetectionManager
    @Published var predictionLabel: String = ""

    init(imageDetector: ImageDetectionManager) {
        self.imageDetector = imageDetector
    }

    func detect(name: String) {

        let sourceImage = UIImage(named: name)

        guard let resizedImage = sourceImage?.resize(targetSize: CGSize(width: 224.0, height: 224.0)) else {

            print("Unable to resize image")
            return
        }

        if let prediction = self.imageDetector.detect(image: resizedImage) {

            self.predictionLabel = prediction
        }
    }
}
