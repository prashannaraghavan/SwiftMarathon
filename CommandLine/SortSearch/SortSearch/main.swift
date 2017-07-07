//
//  main.swift
//  SortSearch
//
//  Created by Prashanna Raghavan on 7/6/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation



class MergeSort
{
    func merge(_ arr:inout [Int],_ aux:inout [Int],_ start:Int,_ mid:Int,_ end:Int) -> Void {
        
        var i = start, j = mid+1
        
        for ij in start...end
        {
            aux.insert(arr[ij], at: ij)
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
            else if aux[i] < aux[j]
            {
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
}

class BinarySearch
{
    func find(_ arr:[Int],_ start:Int,_ end:Int,_ no:Int) -> Bool {
        
        if start >= end {
            return false
        }
        
        let mid = start + (end-start)/2
        
        if arr[mid] == no {
            return true
        }
        else if arr[mid] > no {
            return find(arr,start,mid-1,no)
        }
        else if arr[mid] < no {
            return find(arr,mid+1,end,no)
        }

        return false
    }
}


var merge = MergeSort()
var arr = [6,4,3,2,8,1,9,5,0,7]
var aux = Array(repeating: 0, count: arr.count)
merge.sort(&arr,&aux,0,arr.count-1)

print(arr)

var bin = BinarySearch()
print(bin.find(arr,0,arr.count-1,7) ? "Yes" : "No")
