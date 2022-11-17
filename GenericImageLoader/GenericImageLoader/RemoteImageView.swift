//
//  RemoteImageView.swift
//  GenericImageLoader
//
//  Created by Gabriel Conte on 17/11/2022.
//

import SwiftUI

struct RemoteImageView: View {

    private let source: String

    @State private var image: UIImage?

    @Environment(\.imageLoader) private var imageLoader

    init(source: String) {
        self.source = source
    }

    var body: some View {

        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(16)
                    .padding()
            } else {
                Rectangle()
                    .background(Color.white)
            }
        }
        .task {
            
            await loadImage(at: source)
        }
    }

    func loadImage(at source: String) async {
        do {
            guard let url = URL(string: source) else {
                print("invalid url")
                return
            }
            let request = URLRequest(url: url)

            image = try await imageLoader.fetch(request)
        } catch {
            print(error)
        }
    }
}

struct RemoteImageView_Previews: PreviewProvider {

    static var previews: some View {
        RemoteImageView(source: "https://wallpaperaccess.com/full/18532.jpg")
    }
}
