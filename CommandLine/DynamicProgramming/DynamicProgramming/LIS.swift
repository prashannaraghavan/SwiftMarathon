//
//  LIS.swift
//  DynamicProgramming
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class LongestIncreasingSubsequence
{
    var lis = 1
    
    func lis(_ arr:[Int],_ no:Int) -> Int {
        
        if no == 1 {
            return 1
        }
        
        var result = 0
        var max = 1
        
        for i in 1..<no {
            result = lis(arr,i)
            
            if arr[i-1] < arr[no-1] && result+1 > max {
                max = result + 1
            }
        }
        
        if lis < max {
            lis = max
        }
        
        return max
    }
    
    func longincsub(_ arr:[Int],_ n:Int) -> Int {
     
        var array = Array(repeating: 1, count: n)
        
        for i in 1..<n
        {
            for j in 0..<i {
                if arr[j] < arr[i] && array[i] < array[j] + 1 {
                    array[i] = array[j] + 1
                }
            }
        }
        
        var max = 1
        
        for k in 0..<array.count {
            if array[k] > max {
                max = array[k]
            }
        }
        
        return max
    }
}
