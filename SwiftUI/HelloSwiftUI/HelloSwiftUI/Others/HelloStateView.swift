//
//  HelloStateView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct HelloStateView: View {

    let model = Hike.all()

    @State private var isNice = false

    var body: some View {

        List {

            Toggle(isOn: $isNice) {

                Text("Nice")
                    .font(.title)
            }

            let filteredModel = self.model.filter { $0.isNice == self.isNice }

            ForEach(filteredModel,
                    id: \.id) { hike in

                HStack {
                    Image(hike.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)

                    Text(hike.name)
                        .font(.title)
                        .lineLimit(nil)

                    Spacer()

                    if hike.isNice {

                        Image.init(systemName: "info.circle.fill")
                            .frame(width: 25, height: 25)

                    }
                }
            }
        }
    }
}

struct HelloStateView_Previews: PreviewProvider {
    static var previews: some View {
        HelloStateView()
    }
}
