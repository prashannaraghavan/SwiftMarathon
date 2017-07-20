//
//  main.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var permute = Permutation()
var str = "abc"
var chararr = Array(str.characters)
permute.permute(&chararr, 0, str.characters.count)

var ratmaze = RatMaze()
var maze = [[1,1,0,0],[1,1,0,0],[1,1,1,0],[0,0,1,1]]
ratmaze.solveMaze(maze)

var nqueen = NQueen()
var mat = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
var col = 0
print(nqueen.solve(&mat,col) ? "Yes" : "No")
for j in mat
{
    print(j)
}

var knight = KnightTour()
var tour = [[Int]](repeating: [Int](repeating: -1, count: 8), count: 8)
var move = 1
print(knight.generateTour(&tour, move) ? "Yes" : "No")
for k in tour
{
    print(k)
}
