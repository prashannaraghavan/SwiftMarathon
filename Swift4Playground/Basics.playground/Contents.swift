//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8


print("\(minValue) \(maxValue)")


let multiLine = " This is a multiline string "
print(multiLine)

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
print(catCharacters)

let arr = ["AB","BC","CD","DE"]
print(arr)

let names = ["Anna", "Alex", "Brian", "Jack"]

for a in arr
{
    print(a)
}

for name in names[0...2]
{
    print(name)
}

let range = 0...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true





