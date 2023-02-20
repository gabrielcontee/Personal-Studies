//
//  ContentView.swift
//  PublisherSubscriber
//
//  Created by Gabriel Conte on 22/01/2023.
//

import SwiftUI
import Combine

struct ContentView: View {

    var body: some View {

        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {

            self.setup()
        }
    }

    private func setup() {

        // Subjects
        // - Publishers
        // - Subscribers

        let subject = PassthroughSubject<String, MyError>()//.eraseToAnyPublisher()

        let subscriber = StringSubscriber()

        subject.subscribe(subscriber)

        let subscription = subject.sink { completion in

            print("Received completion: \(completion)")

        } receiveValue: { value in

            print("Sink: \(value)")
        }

        subject.send("A")
        subject.send("B")

        subscription.cancel()

        subject.send("C")
        subject.send("D")
    }
}

class StringSubscriber: Subscriber {

    typealias Input = String
    typealias Failure = MyError

    func receive(subscription: Subscription) {
        print("Received subscription")
        subscription.request(.max(2)) // backpressure, the max number of items to be received
    }

    func receive(_ input: String) -> Subscribers.Demand {
        print("Delegate: \(input)")
        return .max(1) // every event sent the backpressure increases by one
    }

    func receive(completion: Subscribers.Completion<MyError>) {
        print("completed!")
    }
}

enum MyError: Error {

    case subscriberError
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
