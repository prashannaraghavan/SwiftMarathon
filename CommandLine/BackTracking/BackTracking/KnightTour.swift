//
//  KnightTour.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class KnightTour
{
    let max = 64
    let R = 8
    
    /* anti-clockwise fastest*/
    let moveX = [2, 1, -1, -2, -2, -1,  1,  2]
    let moveY = [1, 2,  2,  1, -1, -2, -2, -1]
    
    /* clockwise reasonable*/
//    let moveX = [2,1,-1,-2,-2,-1,1,2]
//    let moveY = [-1,-2,-2,-1,1,2,2,1]
    
    func isSafe(_ tour:[[Int]],_ nextX:Int,_ nextY:Int) -> Bool
    {
        return (nextX >= 0 && nextY >= 0 && nextX < R && nextY < R
            && tour[nextX][nextY] == -1)
    }
    
    func solve(_ tour:inout [[Int]],_ x:Int,_ y:Int,_ move:Int,_ moveX:[Int],_ moveY:[Int]) -> Bool
    {
        if move == max+1 {
            return true
        }
        
        var nextX:Int
        var nextY:Int
        
        for i in 0..<moveX.count {
            
            nextX = x + moveX[i]
            nextY = y + moveY[i]
            
            if isSafe(tour,nextX,nextY) {
                
                tour[nextX][nextY] = move
                
                if solve(&tour, nextX, nextY, move+1, moveX, moveY){
                    return true
                }
                else {
                    tour[nextX][nextY] = -1
                }
                
            }
        }
        
        return false
    }
    
    func generateTour(_ tour:inout [[Int]],_ move:Int) -> Bool {
     
        let x = 0
        let y = 0
        
        tour[x][y] = 1
        
        if solve(&tour, x, y, 2, moveX, moveY)
        {
            return true
        }
        
        return false
    }
}
