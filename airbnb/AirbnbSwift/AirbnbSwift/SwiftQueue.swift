//
//  SwiftQueue.swift
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa

// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Queue/Queue-Optimized.swift
class SwiftQueue<T>: NSObject {
    
    override init() {
        _capacity = 5;
        _list = []
    }
    
    public func offer(obj: T?) {
        guard let obj = obj else {
            return
        }
        
        if _list.count == _capacity {
            _list.remove(at: 0)
        }
        _list.append(obj)
        print(_list)
    }
    
    public func poll() -> T? {
        guard _list.count != 0 else {
            return nil
        }
        let lastObj = _list[_list.count - 1]
        _list.removeLast()
        return lastObj
    } 
    public func printList() {
        print(_list)
    }
    
    public func test() {
        let queue = SwiftQueue<String>()
        if let lastObj = queue.poll() {
            print(lastObj)
        }
        queue.offer(obj: "a")
        if let lastObj = queue.poll() {
            print(lastObj)
        }
    }
    
    private var _list:[T]
    private var _capacity: Int
}
