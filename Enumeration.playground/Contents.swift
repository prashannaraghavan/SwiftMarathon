//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Arithmetic: Int
{
    case Addition = 1,Multiplication,Subtraction,Division
}

print(Arithmetic.Addition.rawValue)

// TO-DO type of ArithmeticExpression ? 
indirect enum ArithmeticExpression
{
    case number(Int)
    case addition(ArithmeticExpression,ArithmeticExpression)
    case multiply(ArithmeticExpression,ArithmeticExpression)
}

let four = ArithmeticExpression(4)
let five = ArithmeticExpression(5)
let sum = ArithmeticExpression(four,five)
let product = ArithmeticExpression(sum,five)

func manipulate(_ expr:ArithmeticExpression -> Int)
{
    switch expr {
    case let .number(val):
        return val
    case let .sum(left,right):
        return manipulate(right) + manipulate(left)
    case let .product(left,right):
        return manipulate(right) * manipulate(left)
    default:
        break;
    }
}

manipulate(product)