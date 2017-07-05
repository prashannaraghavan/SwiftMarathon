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
var array = [9,8,7,6,5,4,3,2,1,0]
insertion.sort(num: &array)

class Bubble
{
    func swap(a:inout Int,b:inout Int)
    {
        let temp = a
        a = b
        b = temp
    }
    
    func sort(num :inout [Int]) -> [Int] {
        for i in 0..<num.count {
            for j in i+1..<num.count
            {
                if num[j] < num[i] { swap(a: &num[i], b: &num[j]) }
            }
        }
        
        return num
    }
}

var bubble = Bubble()
var bubblearray = [4,3,2,7,5,8,1,9,6,0]
bubble.sort(num: &bubblearray)
print(bubblearray.sorted(by: {$0 < $1}))

class Fibonacci
{
    var fib = [Int]()
    func numbers(num :Int) -> [Int] {
        for i in 0...num
        {
            if i==0 || i==1 {
                fib.insert(i, at: i)
            }
                
            else{
                fib.insert(fib[i-1] + fib[i-2], at: i)
            }
        }
        return fib
    }
}

var fibo = Fibonacci()
fibo.numbers(num: 10)


extension Int
{
    func repetition(task: ()->Void)  {
        for _ in 0..<self{
            task()
        }
    }
}

3.repetition {
    print("Hello")
}

class BinarySearch
{
    func bin(_ num:Int,_ start:Int,_ end:Int,_ inarr:[Int]) -> Int {
        let mid = (start+end)/2
        if num == inarr[mid] {
            return mid
        }
        else if num < inarr[mid] {
            return bin(num,0,mid,inarr)
        }
        else{
            return bin(num,mid+1,end,inarr)
        }
    }
    
    func find(num:Int,inarr:[Int]) -> Int {
        let sortedarr = inarr.sorted(by: {$0 < $1})
        return bin(num,0,sortedarr.count,sortedarr)
    }
}

var bin = BinarySearch()
let ar = [4,5,3,2,1]
bin.find(num: 5,inarr:ar)

