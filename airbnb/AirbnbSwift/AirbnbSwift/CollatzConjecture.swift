//
//  CollatzConjecture.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 9/19/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa

class CollatzConjecture: NSObject {

    public static func findLongestStep(n: Int) -> Int {
        var map = [Int: Int]()
        var longest = 0
        for i in 1...n {
            longest = max(longest, dfs(n: i, map: &map))
        }
        print(map)
        return longest
    }
    
    private static func dfs(n: Int, map: inout [Int: Int]) -> Int {
        if n <= 1 {
            return 1
        }
        
        if let num = map[n] {
            return num
        }
        
        var result = 0
        if n % 2 == 0 {
            result = dfs(n: n / 2, map: &map) + 1
        } else {
            result = dfs(n: n * 3 + 1, map: &map) + 1
        }
        map[n] = result
        return result
    }
}
