//
//  MaxSum.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class MaxSum
{
    func maxSum(_ arr:[Int]) -> Int {
        var sum = arr
        
        for i in 1..<arr.count
        {
            for j in 0...i{
                if arr[j] < arr[i] && sum[i] < sum[j] + arr[i] {
                    sum[i] = sum[j] + arr[i]
                }
            }
        }
        
        var max = Int.min
        
        for k in 0..<sum.count {
            
            if max < sum[k]
            {
                max = sum[k]
            }
        }
        
        return max
    }
}
