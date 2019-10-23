//
//  NonAndExcapingClosure.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 10/13/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Foundation

var completionHandlers: [() -> Void] = []
// A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
// When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.
// Marking a closure with @escaping means you have to refer to self explicitly within the closure.
func functionWithEscapingClosure(completionHandler:@escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func functionWithNonescapingClosure(closure: ()-> Void) {
    closure()
}

class ClosureTest {
    var x = 10
    func test() {
        functionWithEscapingClosure {
            self.x = 100;
        }
        functionWithNonescapingClosure {
            x = 200
        }
    }    
}
