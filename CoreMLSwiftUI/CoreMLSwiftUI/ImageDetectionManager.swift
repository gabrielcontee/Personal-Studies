//
//  ImageDetectionManager.swift
//  CoreMLSwiftUI
//
//  Created by Gabriel Conte on 15/12/2022.
//

import UIKit

class ImageDetectionManager {

    let model = try! Resnet50(configuration: .init())

    func detect(image: UIImage) -> String? {

        guard let pixelBuffer = image.toCVPixelBuffer(),
              let prediction = try? model.prediction(image: pixelBuffer) else {

            return nil
        }

        return prediction.classLabel
    }
}
