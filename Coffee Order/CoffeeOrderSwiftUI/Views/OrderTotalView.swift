//
//  OrderTotalView.swift
//  CoffeeOrderSwiftUI
//
//  Created by Gabriel Conte on 30/10/2022.
//

import SwiftUI

struct OrderTotalView: View {

    let total: Double

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "€%.2f", self.total))
                .font(.title)
                .foregroundColor(.black)
            Spacer()
        }.padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 19.0)
    }
}
