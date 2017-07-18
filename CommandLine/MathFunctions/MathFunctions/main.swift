//
//  main.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/10/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var prime = Prime(100)

let sqrtOf = Root()
print(sqrtOf.squareRoot(25))

var lcm = LCM()
print(lcm.lcm(45, 9))
print(lcm.gcd(45, 9))

let fib = Fib(10)
fib.fib(10)
fib.display()

var fibonacci = Fibonacci()
print(fibonacci.fib(10))

let p = Power()
print(p.power(3, 2))

let per = Permutation()
print("Permutation : \(per.nPr(10, 4))")
print("Combination : \(per.nCr(10, 2))")




