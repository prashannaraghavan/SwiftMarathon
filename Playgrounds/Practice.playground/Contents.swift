//: Playground - noun: a place where people can play

import UIKit

class Sum
{
    func sumExist(array:[Int],sum:Int) -> Bool
    {
        var i = 0, j = array.count-1
        while i <= j {
            if array[i]+array[j] == sum {
                return true
            }
            else if array[i]+array[j] > sum {
                j -= 1
            }
            else{
                i += 1
            }
        }
        
        return false
    }
    
    func exist(array:[Int],sum:Int) -> Bool {
        
        var boolArr = Array(repeating: false, count: 100)
        
        for k in 0..<array.count-1
        {
            if boolArr[sum-array[k]] == true{
                return true
            }
            else{
                boolArr[k] = true
            }
        }
        
        return false
    }
    
    func contains(array:[Int],sum:Int) -> Bool {
        
        var visitedElements:Set<Int> = []
        
        for k in 0..<array.count-1
        {
            if visitedElements.contains(sum-array[k]){
                return true
            }
            else{
                visitedElements.insert(array[k])
            }
        }
        
        return false
    }
}

var findSum = Sum()
let arr = [1,4,6,7,2,3]
print(findSum.exist(array: arr.sorted(), sum: 18) ? "Yes" : "No")
print(findSum.sumExist(array: arr.sorted(), sum: 7) ? "Yes" : "No")
print(findSum.contains(array: arr.sorted(), sum: 19) ? "Yes" : "No")

class Fibonacci
{
    func number(n:Int) -> Int {
        if n<2 && n>=0 {
            return n
        }
        else if n>=2
        {
            return number(n:n-1) + number(n:n-2)
        }
        else{
            return -1
        }
    }
    
    func printAll(n:Int) -> [Int] {
        
        var fibNumbers = Array(repeating: -1, count: n+1)
        
        for i in 0..<n+1
        {
            if i>=0 && i<2 {
                fibNumbers[i] = i
            }
            else if i>=2
            {
                fibNumbers[i] = fibNumbers[i-1] + fibNumbers[i-2]
            }
        }
        
        return fibNumbers
    }
    
    func fibWithAddition(n:Int) -> Int {
        var a = 0, b = 1, c = -1
        
        for _ in 0..<n+1
        {
            a = b + c
            c = b
            b = a
        }
        
        return a
    }
}

var fib = Fibonacci()
fib.number(n: 10)
fib.printAll(n: 10)
fib.fibWithAddition(n: 10)


