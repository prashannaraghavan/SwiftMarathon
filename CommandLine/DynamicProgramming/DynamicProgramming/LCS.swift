//
//  LCS.swift
//  DynamicProgramming
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class LongestCommonSubsquence
{
    var lcsarr:[[Int]]
    
    init(_ n:Int,_ m:Int) {
        lcsarr = [[Int]](repeating: [Int](repeating: 1, count: m+1), count: n+1)
    }
    
    func lcs(_ a:[Character],_ b:[Character],_ n:Int,_ m:Int) -> Int {
        if n == 0 || m == 0 {
            return 0
        }
        else if a[n-1] == b[m-1]
        {
            return 1+lcs(a,b,n-1,m-1)
        }
        else
        {
            return max(lcs(a,b,n,m-1), lcs(a,b,n-1,m))
        }
    }
    
    func longcomsub(_ a:[Character],_ b:[Character],_ n:Int,_ m:Int) -> Int {
        
        for i in 0...n {
            for j in 0...m {
                if i == 0 || j == 0 {
                    lcsarr[i][j] = 0
                }
                else if a[i-1] == b[j-1]
                {
                    lcsarr[i][j] = 1+lcsarr[i-1][j-1]
                }
                else
                {
                    lcsarr[i][j] = max(lcsarr[i][j-1],lcsarr[i-1][j])
                }
            }
        }
        
        
        return lcsarr[n][m]
    }
}
