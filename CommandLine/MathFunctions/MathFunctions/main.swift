//
//  main.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/10/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Prime
{
    init(_ number:Int) {
        display(number)
    }
    
    func display(_ number:Int) -> Void {
        
        var flag = [Bool](repeating: true, count: number)
        let range = Int(sqrt(Double(number)))
        
        for i in stride(from: 2, to: range, by: 1)
        {
            if flag[i] == true {
                for j in stride(from: 2*i, to: number, by: i) {
                    flag[j] = false
                }
            }
        }
        
        for i in stride(from: 2, to: number, by: 1)
        {
            if flag[i] == true {
                print(i,terminator: " ")
            }
        }
        print()
    }
}

var prime = Prime(100)

class Root
{
    func squareRoot(_ n:Int) -> Double {
        var x = n, y = 1, e = 0.000001
        
        while Double(x - y) > e {
            x = (x + y)/2
            y = n / x
        }
        
        return Double(y)
    }
}

let sqrtOf = Root()
print(sqrtOf.squareRoot(25))

class LCM
{
    func lcm(_ a:Int,_ b:Int) -> Int {
        if b == 0 {
            return a
        }
        else
        {
            return lcm(b, a % b)
        }
    }
    
    func gcd(_ a:Int,_ b:Int) -> Int {
        if b == 0 {
            return 0
        }
        
        else
        {
            return (a*b)/lcm(a,b)
        }
    }
}

var lcm = LCM()
print(lcm.lcm(45, 9))
print(lcm.gcd(45, 9))

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

let fib = Fib(10)
fib.fib(10)
fib.display()

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

var fibonacci = Fibonacci()
print(fibonacci.fib(10))


class Power{
    func power(_ a:Int,_ b:Int) -> Int {
        if b < 2 {
            return (b == 0) ? 1 : a
        }
        else{
            return a * power(a, b - 1)
        }
    }
}

let p = Power()
print(p.power(3, 2))

class Permutation{
    func fact(_ a:Int) -> Int {
        if a == 0 {
            return 1
        }
        else{
            return a*fact(a-1)
        }
    }
    
    func nPr(_ n:Int,_ r:Int) -> Int {
        return fact(n)/fact(n-r)
    }
    
    func nCr(_ n:Int,_ r:Int) -> Int {
        return fact(n)/(fact(n-r) * fact(r))
    }
}

let per = Permutation()
print("Permutation : \(per.nPr(10, 4))")
print("Combination : \(per.nCr(10, 2))")




