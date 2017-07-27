//
//  MaxSlidingSum.swift
//  DynamicProgramming3
//
//  Created by Prashanna Raghavan on 7/26/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class MaxSlidingSum
{
    func find(_ arr:[Int]) -> Int
    {
        var max = 0,actualmax = 0
        
        for i in 0..<arr.count {
            max = max + arr[i]
            
            if max < 0 {
                max = 0
            }
            
            else if actualmax < max {
                actualmax = max
            }
        }
        
        return actualmax
    }
    
    func findMaxInNeg(_ arr:[Int]) -> Int
    {
        var maxi = arr[0],actualmax = arr[0]
        
        for j in 1..<arr.count
        {
            maxi = max(arr[j], maxi+arr[j])
            actualmax = max(actualmax, maxi)
        }
        
        return actualmax
    }
}
