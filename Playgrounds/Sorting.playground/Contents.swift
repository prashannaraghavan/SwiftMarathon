//: Playground - noun: a place where people can play

import UIKit

class QuickSort
{
    func partition(_ arr:inout [Int],_ start:Int,_ end:Int) -> Int
    {
        let mid = (start+end)/2
        return mid
    }
    
    func sort(_ arr:inout [Int],_ start:Int,_ end:Int)
    {
        var mid = partition(&arr,start,end)
        sort(&arr,start,mid-1)
        sort(&arr,mid+1,end)
    }
    
    func sort(_ arr:inout [Int])
    {
        sort(&arr,0,arr.count-1)
    }
}

var quick = QuickSort()
var arr = [8,5,3,7,2,0,6,1]
quick.sort(&arr)
