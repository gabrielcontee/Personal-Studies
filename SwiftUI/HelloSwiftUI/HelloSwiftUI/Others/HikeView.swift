//
//  HikeView.swift
//  HelloSwiftUI
//
//  Created by Gabriel Conte on 13/10/2022.
//

import SwiftUI

struct HikeView: View {

    let hikes = Hike.all()

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        NavigationView {
            //            VStack {
            //                List(self.hikes, id: \.name) { hike in
            //
            //                    NavigationLink(destination: HikeDetailView(hike: hike)) {
            //                        HikeCell(hike: hike)
            //                    }
            //                }
//        }
            ScrollView {
                LazyVGrid(columns: columns,
                          spacing: 10,
                          pinnedViews: [.sectionHeaders]) {

                    ForEach(1..<11) { index in

                        Section(header: self.headerView(index)) {

                            ForEach(1..<10) { _ in
                                Rectangle()
                                    .fill(Color.red)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .navigationTitle("Hikings")
                }
            }
        }
    }

    private func headerView(_ index: Int) -> some View {

        Text("Section \(index)")
            .padding()
            .foregroundColor(Color.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HikeView()
    }
}

struct HikeCell: View {

    let hike: Hike

    var body: some View {
        HStack {
            Image(hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)

            VStack(alignment: .leading) {
                Text(hike.name)
                    .font(.title)
                Text(String(format: "%.2f", hike.miles) + " miles")
            }
        }
    }
}
