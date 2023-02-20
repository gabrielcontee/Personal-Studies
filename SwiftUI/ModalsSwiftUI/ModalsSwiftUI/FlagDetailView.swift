//
//  FlagDetailView.swift
//  ModalsSwiftUI
//
//  Created by Gabriel Conte on 12/12/2022.
//

import SwiftUI

struct FlagDetailView: View {

    @Binding var flagViewModel: FlagViewModel

    var body: some View {
        VStack {
            Text(self.flagViewModel.flag)
                .font(.system(size: 200))
            TextField("Enter country name",
                      text: self.$flagViewModel.country)
                .font(.system(size: 28))
                .padding()
                .fixedSize()

            Button {
                self.flagViewModel.showModal.toggle()
            } label: {
                Text("Submit")
                    .font(.system(size: 28))
            }

            
        }
    }
}

struct FlagDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flagViewModel: .constant(FlagViewModel()))
    }
}
