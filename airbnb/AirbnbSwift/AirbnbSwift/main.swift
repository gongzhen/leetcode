//
//  main.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Foundation

print("Hello, World!")

let queue = SwiftQueue<String>()
if let lastObj = queue.poll() {
    print(lastObj)
} else {
    print("lastObj is nil")
}
queue.offer(obj: "A")
queue.offer(obj: "B")
queue.offer(obj: "C")

if let lastObj = queue.poll() {
    print("lastObj is \(lastObj)")
} else {
    print("lastObj is nil")
}

queue.printList()
queue.offer(obj: "A")
queue.offer(obj: "B")
queue.offer(obj: "C")
queue.offer(obj: "D")

queue.printList()

let secondQueue = QueueWithoutList<String>(capacity: 5)
if let first = secondQueue.poll() {
    print(first)
} else {
    print("first is nil")
}

secondQueue.offer(e: "A")
var res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "B")
res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "C")
res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "D")
res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "E")
res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "F")
res = secondQueue.printQueue()
print(res)
secondQueue.offer(e: "H")
res = secondQueue.printQueue()
print(res)

let longest = CollatzConjecture.findLongestStep(n: 10)
print(longest)

let obj451 = LC451()
res = obj451.frequencySort("tree")
print(res)

let obj = ClosureTest()
obj.test()
print(obj.x)

completionHandlers.first?()
print(obj.x)

let camelCase = convertFromSnakeCase("abc_def_lid_")
print(camelCase)

class MyClass {
    func greeting() {
        answer += "Hello, World!"
    }
    
    deinit {
        print("My Class is deinit")
    }
}

class Handler {
    var closure: (() -> Void)?
    var obj = MyClass()

    func setupClosure() {
        closure = { [unowned self] in
            self.obj.greeting()
        }
    }

    deinit {
        answer += " Handler is being deinitialized."
    }
}

var answer: String = ""
func handlerDeinitialization() -> String {
    var handler: Handler? = Handler()
    handler!.setupClosure()
    handler!.closure!()
    handler = nil
    return answer
}

print(handlerDeinitialization())

//let dispatchQueueTest = DispatchQueueTest()
//print(dispatchQueueTest)

struct Point {
    var x = 0.0, y = 0.0
    
    mutating func incrementBy(X: Double, Y: Double) {
        x += X
        y += Y
    }
}

var myPoint = Point(x: 2.0, y: 1.0)
myPoint.incrementBy(X: 2.0, Y: 3.0)
print("\(myPoint.x), \(myPoint.y)")

let _ = UberInterview()

