//
//  Merge.swift
//  MergeQuick
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

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
