//: Playground - noun: a place where people can play

import UIKit

//TO-DO : Need to revisit logic

class Area
{
    func waterarea(_ arr:[Int],_ start:Int,_ end:Int) -> Int
    {
        var i = start, j = end
        var area = 0
        
        while i < end && arr[i] == 0{
            i += 1
        }
        
        while j >= 0 && arr[j] == 0{
            j -= 1
        }
        
        var left = i
        var right = j
        
        while i >= j
        {
            if arr[left] < arr[i]
            {
                area += (i-left-1)*min(arr[left],arr[i])
                left = i
                i += 1
            }
            if arr[j] > arr[right]
            {
                area += (right-j-1)*min(arr[right],arr[j])
                right = j
                j -= 1
            }
        }
        
        if i >= j
        {
            area += (right-left-1)*min(arr[left],arr[right])
            return area
        }
        
        return 1
    }
    
    func calc(_ arr:[Int],_ start:Int,_ end:Int) -> Int{
        var area = 0
        let n = end
        var left = start
        var right = end
        
        for i in 0...n/2{
            
            let j = n-i
            
            if i >= j {
                return area
            }
            
            if arr[i] != 0 {
                area = (i-left-1)*min(arr[i], arr[left])
                left = arr.index(of: max(arr[i], arr[left]))!
            }
            if arr[j] != 0 {
                area = (right-j-1)*min(arr[j], arr[right])
                right = arr.index(of: max(arr[j], arr[right]))!
            }
        }
        
        return area
    }
}

var area = Area()
let arr = [1,0,5,0,8,0,0,7]
let a = area.waterarea(arr,0,arr.count-1)
print("Area is \(a)")


