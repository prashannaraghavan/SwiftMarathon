//
//  Median.swift
//  DivideConquer
//
//  Created by Prashanna Raghavan on 7/22/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Median
{
    func findMedian(_ a:[Int],_ b:[Int],_ l:Int) -> Double {
        
        var mA = -1, mB = -1
        var i = 0,j = 0
        
        for _ in 0...l{
            
            if i == l {
                mA = mB
                mB = b[0]
                break
            }
            else if j == l {
                mA = mB
                mB = a[0]
                break
            }
            
            if a[i] < b[j]
            {
                mA = mB
                mB = a[i]
                i += 1
            }
            else
            {
                mA = mB
                mB = b[j]
                j += 1
            }
        }
        
        return Double((mA+mB)/2)
    }
}
