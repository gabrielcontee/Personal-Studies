//
//  SwitchToLatestView.swift
//  PublisherSubscriber
//
//  Created by Gabriel Conte on 27/01/2023.
//

import SwiftUI
import Combine

struct SwitchToLatestView: View {

    let imagesName = ["houston", "denver", "seattle"]
    @State var index = 0
    let taps = PassthroughSubject<Void, Never>()

    var body: some View {

        Text("Hello, World!")

            .onAppear {

                self.tap()
            }
    }

    func getImage() -> AnyPublisher<UIImage?, Never> {

        return Future<UIImage?, Never> { promise in

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {

                promise(.success(UIImage(named: imagesName[index])))
            }
        }.map { $0 }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    func tap() {

        taps.map { _ in self.getImage() }
            .switchToLatest()
            .sink { image in

                print(image)
            }

        taps.send()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {

            self.index = self.index + 1
            taps.send()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {

            self.index = self.index + 1
            taps.send()
        }
    }
}

struct SwitchToLatestView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchToLatestView()
    }
}
