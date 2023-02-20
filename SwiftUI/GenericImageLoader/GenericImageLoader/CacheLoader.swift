//
//  CacheLoader.swift
//  GenericImageLoader
//
//  Created by Gabriel Conte on 17/11/2022.
//

import UIKit

actor CacheLoader {

    static func imageFromFileSystem(for urlRequest: URLRequest) throws -> UIImage? {

        guard let url = Self.fileName(for: urlRequest),
              let data = try? Data(contentsOf: url) else {

            return nil
        }

        return UIImage(data: data)
    }

    static func fileName(for urlRequest: URLRequest) -> URL? {

        guard let fileName = urlRequest.url?.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {

            return nil
        }

        return applicationSupport.appendingPathComponent(fileName)
    }
}
