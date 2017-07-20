//
//  NQueen.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class NQueen{
    
    var R = 4
    var C = 4
    
    func isSafe(_ move:[[Int]],_ row:Int,_ col:Int) -> Bool {
        
        for i in 0..<col {
            if move[row][i] == 1
            {
                return false
            }
        }
        
        var m = col-1
        for j in stride(from: row-1, through: 0, by: -1) {
            if m < 0 {
                break
            }
            if move[j][m] == 1
            {
                return false
            }
            m = m-1
        }
        
        var k = col-1
        for l in stride(from: row+1, through: 0, by: 1) {
            if k < 0 {
                break
            }
            if move[l][k] == 1
            {
                return false
            }
            k = k-1
        }
        
        return true
    }
    
    func solve(_ move:inout [[Int]],_ col:Int) -> Bool {
        
        if col >= C{
            return true
        }
        
        for r in 0..<R {
            if isSafe(move,r,col) {
                move[r][col] = 1
                if solve(&move,col+1)
                {
                    return true
                }
                
                move[r][col] = 0
            }
        }
        
        return false
    }
}
