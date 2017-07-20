//
//  RatMaze.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class RatMaze{
    
    let R = 4
    let C = 4
    
    func isSafe(_ soln:[[Int]],_ startX:Int,_ startY:Int) -> Bool {
        return (startX >= 0 && startY >= 0 && startX <= R-1  && startY <= C-1 && soln[startX][startY] == 1)
    }
    
    func solveMaze(_ maze:[[Int]],_ soln:inout [[Int]],_ startX:inout Int,_ startY:inout Int) -> Bool {
        
        if startX == R-1 && startY == R-1 {
            soln[startX][startY] = 1
            return true
        }
        
        if isSafe(maze,startX,startY)
        {
            soln[startX][startY] = 1
            var mutX = startX+1
            var mutY = startY+1
            
            if solveMaze(maze, &soln, &mutX, &startY){
                return true
            }
            if solveMaze(maze, &soln, &startX, &mutY){
                return true
            }
            
            soln[startX][startY] = 0
            return false
        }
        
        return false
    }
    
    func solveMaze(_ maze:[[Int]]) -> Void {
        var soln = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
        var x = 0, y = 0
        print(solveMaze(maze,&soln,&x,&y) ? "Solution available" : "Solution not available")
        print(soln)
    }
}

