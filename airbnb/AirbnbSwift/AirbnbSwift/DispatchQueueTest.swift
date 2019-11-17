//
//  DispatchQueueTest.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 11/15/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa
class DispatchQueueTest {
    // https://juejin.im/post/5c4932056fb9a049ac7982e2
    // let queue = DispatchQueue(label: "Serial.Queue")
    let queue = DispatchQueue(label: "concurrent.com", attributes: .concurrent)
    
    init() {
        queue.async {
            print("1")
            self.queue.async { print("2") }
            print("3")
        }
        // Prints "1"
        queue.sync {
            print("1")
            self.queue.async { print("2") }
            print("3")
        }
        sleep(5)
    }
}

