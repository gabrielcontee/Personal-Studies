//
//  ImageLoader.swift
//  GenericImageLoader
//
//  Created by Gabriel Conte on 17/11/2022.
//

import UIKit
import SwiftUI

public enum LoaderError: Error {
    case genericError
}

// Adds an instance of ImageLoader to the SwiftUI environment, allowing us to easily access it from within our custom view
struct ImageLoaderKey: EnvironmentKey {
    static let defaultValue = ImageLoader()
}

extension EnvironmentValues {
    var imageLoader: ImageLoader {
        get { self[ImageLoaderKey.self] }
        set { self[ImageLoaderKey.self ] = newValue}
    }
}

actor ImageLoader {

    private enum LoaderStatus {
        case inProgress(Task<UIImage, Error>)
        case fetched(UIImage)
    }

    private var images: [URLRequest: LoaderStatus] = [:]

    public func fetch(_ url: URL) async throws -> UIImage {

        let request = URLRequest(url: url)

        return try await fetch(request)
    }

    public func fetch(_ urlRequest: URLRequest) async throws -> UIImage {

        if let status = images[urlRequest] {
            switch status {
            case .fetched(let image):
                return image

            case .inProgress(let task):
                return try await task.value
            }
        }

//        if let image = try CacheLoader.imageFromFileSystem(for: urlRequest) {
//
//            images[urlRequest] = .fetched(image)
//
//            return image
//        }

        let task: Task<UIImage, Error> = Task {

            let (imageData, _) = try await URLSession.shared.data(for: urlRequest)

            guard let image = UIImage(data: imageData) else {

                throw LoaderError.genericError
            }

//            try self.persistImage(image, for: urlRequest)

            return image
        }

        images[urlRequest] = .inProgress(task)

        let image = try await task.value

        images[urlRequest] = .fetched(image)

        return image
    }

    private func persistImage(_ image: UIImage, for urlRequest: URLRequest) throws {

        guard let url = CacheLoader.fileName(for: urlRequest),
              let data = image.jpegData(compressionQuality: 0.8) else {

           return
        }

        try data.write(to: url)
    }
}
