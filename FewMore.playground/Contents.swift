//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var num:Int?

if let optNum = num{
    print(optNum)
}
else
{
    print("no value")
}

let condNum=5
if condNum > 0{
    if condNum < 10 {
        if condNum==5 {
            print(condNum)
        }
    }
}

class Stack
{
    var stackArr = [Int]()
    var top = -1
    
    func isEmpty() -> Bool {
        return stackArr.isEmpty
    }
    
    func isFull() -> Void {

    }
    
    func push(num:Int) -> Void {
        top += 1
        stackArr.insert(num, at: top)
        
        defer {
            print()
            display()
        }
    }
    
    func pop() -> Any {
        if !isEmpty() {
            let item = stackArr.popLast()
            defer {
                print()
                display()
            }
            return item!
        }
        
        return "Empty"
    }
    
    func display() -> Void {
        for item in stackArr
        {
            print(item, separator: "-", terminator: " ")
        }
    }
}

var stack = Stack()
stack.push(num: 8)
stack.push(num: 9)
stack.push(num: 7)
stack.pop()
stack.pop()
stack.pop()

class Selection
{
    func swap(a:inout Int,b:inout Int)
    {
        let temp = a
        a = b
        b = temp
    }
    
    func sort(num :inout [Int]) -> [Int] {
        for i in 0..<num.count {
            var min = i
            for j in i+1..<num.count
            {
                if num[j] < num[min] { min = j }
            }
            swap(a: &num[min], b: &num[i])
        }
    
    return num
    }
}

var selection = Selection()
var arr = [4,3,2,7,5,8,1,9,6,0]
selection.sort(num: &arr)


class Insertion
{
    func swap(a:inout Int,b:inout Int)
    {
        let temp = a
        a = b
        b = temp
    }
    
    func sort(num :inout [Int]) -> [Int] {
        for i in 1..<num.count {
            for j in stride(from:i, to:0, by:-1)
            {
                if num[j] < num[j-1] { swap(a: &num[j], b: &num[j-1]) }
            }
        }
        
        return num
    }
}

var insertion = Insertion()
var array = [4,3,2,7,5,8,1,9,6,0]
insertion.sort(num: &array)

