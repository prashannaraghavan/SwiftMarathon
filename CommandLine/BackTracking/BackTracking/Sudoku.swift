//
//  Sudoku.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/20/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Sudoku
{
    let N = 9
    
    func isFree(_ board:[[Int]],_ row:Int,_ col:Int) -> (Int,Int,Bool) {
        for row in 0..<N
        {
            for col in 0..<N
            {
                if board[row][col] == 0
                {
                    return (row,col,true)
                }
            }
        }
        
        return (row,col,false)
    }
    
    
    func usedInRow(_ board:[[Int]],_ row:Int,_ col:Int,_ num:Int) -> Bool {
        
        for c in 0..<N
        {
            if board[row][c] == num
            {
                return true
            }
        }
        
        return false
    }
    
    func usedInCol(_ board:[[Int]],_ row:Int,_ col:Int,_ num:Int) -> Bool {
        for r in 0..<N
        {
            if board[r][col] == num
            {
                return true
            }
        }
        
        return false
    }
    
    func usedInBox(_ board:[[Int]],_ row:Int,_ col:Int,_ num:Int) -> Bool {
        for i in 0..<3
        {
            for j in 0..<3
            {
                if board[row+i][col+j] == num
                {
                    return true
                }
            }
        }
        
        return false
    }
    
    func isSafe(_ board:[[Int]],_ row:Int,_ col:Int,_ num:Int) -> Bool {
        return (!usedInRow(board, row, col, num)
            && !usedInCol(board, row, col, num) && !usedInBox(board, row - row%3, col - col%3, num))
    }
    
    func solve(_ board:inout [[Int]]) -> Bool {
        
        var row = 0, col = 0
        var flag = false
        (row,col,flag) = isFree(board,row,col)
    
        if !flag
        {
            return true
        }
        
        for no in 1...N
        {
            if isSafe(board, row, col, no)
            {
                board[row][col] = no
                
                if solve(&board) {
                    return true
                }
                
                board[row][col] = 0
            }
        }
        
        return false
    }
}
