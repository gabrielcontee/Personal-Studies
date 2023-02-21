import UIKit
import Dispatch
import Combine

var greeting = "Hello, playground"

struct Effect<A> {

    public let run: (@escaping (A) -> Void) -> Void

    public func map<B>(_ f: @escaping (A) -> B) -> Effect<B> {
        return Effect<B> { callback in self.run { a in callback(f(a)) } }
    }
}

let anIntInTwoSeconds = Effect<Int> { callback in
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        callback(42)
    }
}

anIntInTwoSeconds.run { int in print(int) }

let aFutureInt = Deferred { // ensures that if the aFutureInt is cancelled, we don't get the value
    Future<Int, Never> { callback in
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            callback(.success(42))
        }
    }
}

aFutureInt.subscribe(AnySubscriber(receiveSubscription: { subscription in
    print("subscription")
    subscription.request(.unlimited)
},
                                   receiveValue: { value in
    print("value", value)
    return .unlimited // will receive unlimited aditional values
},
                                   receiveCompletion: { completion in
    print("completion")
}))

let cancellable = aFutureInt.sink { int in
    print(int)
}

//cancellable.cancel()

let passthrough = PassthroughSubject<Int, Never>.init()
let currentValue = CurrentValueSubject<Int, Never>.init(2)

passthrough.sink { x in
    print("passthrough", x)
}

