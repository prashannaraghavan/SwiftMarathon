//
//  EditDist.swift
//  DynamicProgramming
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class EditDist{
    
    var editArr:[[Int]]
    
    init(_ m:Int,_ n:Int) {
        editArr = [[Int]](repeating: [Int](repeating: 1, count: n+1), count: m+1)
    }
    
    func edit(_ a:[Character],_ b:[Character],_ m:Int,_ n:Int) -> Int {
        if m == 0 {
            return n
        }
        else if n == 0 {
            return m
        }
        else if a[m-1] == b[n-1]
        {
            return edit(a,b,m-1,n-1)
        }
        else
        {
            return 1 + min(edit(a,b,m-1,n-1), min(edit(a,b,m-1,n), edit(a,b,m,n-1)))
        }
    }
    
    func editDt(_ a:[Character],_ b:[Character],_ m:Int,_ n:Int) -> Int {
        
        for i in 0...m {
            for j in 0...n{
                if i == 0 {
                    editArr[i][j] = j
                }
                else if j == 0 {
                    editArr[i][j] = i
                }
                else if a[i-1] == b[j-1]
                {
                    editArr[i][j] = editArr[i-1][j-1]
                }
                else
                {
                    editArr[i][j] = 1 + min(editArr[i-1][j-1], min(editArr[i][j-1], editArr[i-1][j]))
                }
            }
        }
        
        return editArr[m][n]
    }
}
