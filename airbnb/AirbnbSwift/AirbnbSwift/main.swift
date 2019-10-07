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
