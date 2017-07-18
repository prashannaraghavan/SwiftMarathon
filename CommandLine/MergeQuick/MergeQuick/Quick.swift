//
//  Quick.swift
//  MergeQuick
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class QuickSort
{
    func partition(_ arr:inout [Int],_ start: Int,_ end:Int) -> Int {
        
        var i = start, j = end+1
        
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
        
        swap(&arr[j], &arr[start])
        return j
    }
    
    func sort(_ arr:inout [Int],_ start: Int,_ end:Int) -> Void {
        if start >= end {
            return
        }
        let mid = partition(&arr,start,end)
        sort(&arr,start,mid-1)
        sort(&arr,mid+1,end)
    }
    
    func sort(_ arr:inout [Int]) -> Void {
        sort(&arr,0,arr.count-1)
    }
}
