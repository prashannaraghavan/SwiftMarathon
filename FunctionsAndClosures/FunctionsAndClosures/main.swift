//
//  main.swift
//  FunctionsAndClosures
//
//  Created by Prashanna Raghavan on 6/29/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

print("Hello, World!")
var array = ["one","two","three","four"]
var newArray = array.sorted(by: { (s1: String,s2: String) -> Bool in
    return s1>s2 })
print(newArray)

var newArray1 = array.sorted(by: { (s1: String,s2: String) -> Bool in return s1>s2 })
print(newArray1)

var newArray2 = array.sorted(by: { (s1,s2) -> Bool in return s1>s2 })
print(newArray2)

var newArray3 = array.sorted(by: { (s1,s2) -> Bool in s1>s2 })
print(newArray3)

var newArray4 = array.sorted(by: { (s1,s2) in s1>s2 })
print(newArray4)

var newArray5 = array.sorted(by: { $0 > $1 })
print(newArray5)

var newArray6 = array.sorted(by: >)
print(newArray6)

var newArray7 = array.sorted(){ $0 < $1 }
print(newArray7)

var newArray8 = array.sorted{ $0 < $1 }
print(newArray8)

var digits = [1:"one",2:"two"]
print(digits)

var numbers = [212,112,222,111]

var word = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat
    {
        output = digits[number % 10]! + output
        number = number / 10
    }while number > 0
    
    return output
}

print(word)

func incrementerfunc(forIncrementer num: Int) -> () -> Int {
    var total = 0
    
    func incrementer() -> Int
    {
        total += num
        return total
    }
    
    return incrementer
}

var incrementByTen = incrementerfunc(forIncrementer: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())

var incrementBySeven = incrementerfunc(forIncrementer: 7)
print(incrementBySeven())
print(incrementBySeven())
print(incrementBySeven())

var anotherIncByTen = incrementByTen
print(anotherIncByTen())

var anotherIncBySeven = incrementBySeven
print(anotherIncBySeven())


func div(a: Int,b: Int) -> Void{
    print("Value is \(Double(a / b))")
    
    defer {
        print("something happened")
    }
}

print(div(8, 2))

var completion: [()->Void] = []

func escapingClosure(handler: @escaping () -> Void) {
    completion.append(handler)
}

func nonEscapingClosure(handler: () -> Void) {
    handler()
}

class RandomClass: NSObject {
    var rand = 10
    func randomFunc() -> Void{
        nonEscapingClosure {
            rand = 20
        }
        
        escapingClosure {
            self.rand = 100
        }
    }
}

    
var ins = RandomClass()
ins.randomFunc()

print(ins.rand)
completion.first!()
print(ins.rand)

var newFunc = {array.remove(at: 0)}
print(array.count)

print("Printing : \(newFunc())")
print(array.count)

func serve(customer cust:() -> String)
{
    print("Serving \(cust())")
}

serve(customer: { array.remove(at: 0) })

func serve(customer cust: @autoclosure () -> String)
{
    print("Serving \(cust())")
}

serve(customer: array.remove(at: 0) )





