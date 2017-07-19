//
//  MinCost.swift
//  DynamicProgramming
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class MinCost
{
    var minarr:[[Int]]
    var R:Int
    var C:Int
    
    init(_ m:Int,_ n:Int) {
        minarr = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        R = m
        C = n
    }
    
    func cost(_ costMat:[[Int]],_ m:Int,_ n:Int) -> Int
    {
        if m < 0 || n < 0 {
            return Int.max
        }
        else if m == 0 && n == 0 {
            return costMat[m][n]
        }
        else
        {
            return costMat[m][n] + min(cost(costMat,m-1,n-1),min(cost(costMat,m,n-1),cost(costMat,m-1,n)))
        }
    }
    
    func getMinCost(_ costMat:[[Int]],_ m:Int,_ n:Int) -> Int{
        
        minarr[0][0] = costMat[0][0]
        
        for i in 1..<R {
            minarr[0][i] = minarr[0][i-1] + costMat[0][i]
        }
        
        for j in 1..<C {
            minarr[j][0] = minarr[j-1][0] + costMat[j][0]
        }
        
        for k in 1..<R
        {
            for l in 1..<C
            {
                minarr[k][l] = costMat[k][l] +
                min(minarr[k-1][l-1],min(minarr[k-1][l],minarr[k][l-1]))
            }
        }
        
        return minarr[m][n]
    }
}
