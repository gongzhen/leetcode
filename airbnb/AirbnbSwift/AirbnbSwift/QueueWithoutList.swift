//
//  QueueWithoutList.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 9/19/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa

class Entry<T> {
    var next: Entry<T>?
    var prev: Entry<T>?
    var v: T?
    init(v: T? = nil) {
        self.v = v
        self.prev = nil
        self.next = nil
    }
}

class QueueWithoutList<T>: NSObject {
    
    override init() {
        self.capacity=5
        self.size=0
    }
    
    init(capacity: UInt) {
        self.capacity = capacity
        self.size = 0
        self.head = Entry()
        self.tail = Entry()
        self.head?.next = self.tail
        self.tail?.prev = self.head
    }
    
    public func offer(e: T) {
        // add to last
        guard capacity != 0 else {
            return
        }
        if size == capacity {
            // remove the first entry
            disconnect(entry: self.head?.next)
            size = size - 1
        }
        let entry = Entry(v: e)
        appendToTail(entry: entry)
        size = size + 1
    }
    
    public func poll() -> T? {
        guard capacity != 0, size != 0 else {
            return nil
        }
        
        let firstEntry = self.head?.next
        disconnect(entry: self.head?.next)
        size = size - 1
        return firstEntry?.v
    }
    
    public func printQueue() -> String {
        guard capacity != 0, size != 0 else {
            return "[ ]"
        }
        
        var ptr = self.head?.next
        
        var str = "["
        while ptr != nil {
            if let ptr = ptr, let v = ptr.v {
                str = str + "\(v), "
            } else {
                break
            }
            ptr = ptr?.next
        }
        str = str + "]"
        return str
    }
    
    private func disconnect(entry: Entry<T>?) {
        guard let entry = entry else {
            return
        }
        entry.prev?.next = entry.next
        entry.next?.prev = entry.prev
    }
    
    private func appendToTail(entry: Entry<T>?) {
        entry?.prev = self.tail?.prev
        self.tail?.prev?.next = entry
        entry?.next = self.tail
        self.tail?.prev = entry
    }
    

    var head: Entry<T>?
    var tail: Entry<T>?
    var capacity: UInt
    var size: UInt
}
