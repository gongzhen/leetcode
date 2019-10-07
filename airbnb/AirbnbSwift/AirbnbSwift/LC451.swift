//
//  LC451.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 9/24/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa

class LC451: NSObject {
    struct Pair {
        var count: Int
        var c: Character
        
        init(count: Int, c: Character) {
            self.count = count
            self.c = c
        }
    }
    
    func frequencySort(_ s: String) -> String {
        var map = [Character: Int]()
        for c in s {
            if var count = map[c] {
                count = count + 1
                map[c] = count
            } else {
                map[c] = 1
            }
        }
        
        var pairs:[Pair] = []
        
        for (c, count) in map {
            pairs.append(Pair(count:count, c: c))
        }
        
        let sortedPairs = pairs.sorted(by: { $0.count > $1.count })
        
        
        var result = ""
        for pair in sortedPairs {
            let count = pair.count
            let c = pair.c
            for _ in 0..<count {
                result = result + String(c)
            }
        }
        return result
    }
}
