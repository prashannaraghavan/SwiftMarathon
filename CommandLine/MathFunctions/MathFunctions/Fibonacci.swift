//
//  Fibonacci.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation


class Fib
{
    var fib: [Int]!
    
    init(_ no:Int) {
        fib = Array(repeating: -1, count: no+1)
    }
    
    func fib(_ n:Int) -> Void {
        for i in 0...n {
            if i < 2 {
                fib[i] = i
            }
            else{
                fib[i] = fib[i-1] + fib[i-2]
            }
        }
    }
    
    func display() -> Void {
        print(fib)
    }
}

class Fibonacci
{
    func fib(_ n:Int) -> Int {
        var a = -1,b = 0,c = 1
        
        if n < 2 {
            return n
        }
            
        else{
            var i = 2
            while i < n {
                a = b + c
                b = c
                c = a
                i += 1
            }
            return a
        }
    }
}
