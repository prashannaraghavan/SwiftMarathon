//: Playground - noun: a place where people can play

import UIKit
import Foundation

class QuickMerge
{
    func partition(_ arr:inout [Int],_ start:Int,_ end:Int) -> Int {
        var i = start,j = end+1
        
        while true {
            i += 1
            while arr[i] < arr[start] {
                if i == end {
                    break
                }
                i += 1
            }
            
            j -= 1
            while arr[j] > arr[start] {
                if j == start {
                    break
                }
                j -= 1
            }
            
            if i >= j {
                break
            }
            
            swap(&arr[i], &arr[j])
        }
        
        swap(&arr[start], &arr[j])
        return j
    }
    
    func sort(_ arr:inout [Int],_ start:Int,_ end:Int) -> [Int] {
        if start >= end {
            return arr
        }
        let mid = partition(&arr,start,end)
        sort(&arr, start, mid-1)
        sort(&arr, mid+1, end)
        return arr
    }
    
    
    func sort(_ arr:inout [Int]) -> [Int] {
        sort(&arr,0,arr.count-1)
        return arr
    }
}

var quick = QuickMerge()
var arr = [5,3,1,7,4,2]
quick.sort(&arr)

class MergeSort
{
    func merge(_ arr:inout [Int],_ aux:inout [Int],_ start:Int,_ mid:Int,_ end:Int) -> Void {
        
        var i = start,j = mid+1
        for ij in start...end {
            aux[ij] = arr[ij]
        }
        
        for k in start...end {
            if i > mid {
                arr[k] = aux[j]
                j += 1
            }
            else if j > end {
                arr[k] = aux[i]
                i += 1
            }
            else if aux[i] < aux[j] {
                arr[k] = aux[i]
                i += 1
            }
            else
            {
                arr[k] = aux[j]
                j += 1
            }
        }
    }
    
    func sort(_ arr:inout [Int],_ aux:inout [Int],_ start:Int,_ end:Int) -> Void {
        if start >= end {
            return
        }
        
        let mid = start + (end-start)/2
        sort(&arr, &aux, start, mid)
        sort(&arr, &aux, mid+1, end)
        merge(&arr, &aux, start, mid, end)
        
    }
    
    func sort(_ arr:inout [Int]) -> Void {
        var aux = Array(repeating: 0, count: arr.count)
        sort(&arr,&aux,0,arr.count-1)
    }
}

var merge = MergeSort()
var array = [5,8,2,3,9,1]
merge.sort(&array)
print()

for i in array{
    print(i,terminator:" ")
}