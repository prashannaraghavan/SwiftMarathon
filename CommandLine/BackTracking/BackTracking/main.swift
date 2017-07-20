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
