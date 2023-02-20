//
//  ContentView.swift
//  ChartsSwiftUI
//
//  Created by Gabriel Conte on 08/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        BarGraph(reports: Report.all())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
