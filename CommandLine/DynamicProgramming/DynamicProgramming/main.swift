//
//  main.swift
//  DynamicProgramming
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var lis = LongestIncreasingSubsequence()
var arr = [1,4,6,2,5,9,3,7,8]
print("Array : \(arr)")
print("Length of Longest Increasing Subsequence : \(lis.lis(arr, arr.count))")
print("Length of Longest Increasing Subsequence : \(lis.longincsub(arr, arr.count))")

var a = "prashanna"
var b = "raghavan"
var lcs = LongestCommonSubsquence(a.characters.count, b.characters.count)
var n = lcs.lcs(Array(a.characters), Array(b.characters), a.characters.count, b.characters.count)
print("Longest Common Subsequence : \(n)")
var m = lcs.longcomsub(Array(a.characters), Array(b.characters), a.characters.count, b.characters.count)
print("Longest Common Subsequence : \(m)")

var fname = "prashanna"
var lname = "raghavan"
var dist = EditDist(fname.characters.count, lname.characters.count)
var x = dist.edit(Array(fname.characters),Array(lname.characters), fname.characters.count, lname.characters.count)
print("Edit Distance : \(x)")
var y = dist.editDt(Array(fname.characters),Array(lname.characters), fname.characters.count, lname.characters.count)
print("Edit Distance : \(y)")

var cost = [[1,2,3],[4,5,6],[7,8,9]]
var mincost = MinCost(3,3)
var z = mincost.cost(cost, 2, 2)
print("Min cost to reach the dest is \(z)")
var w = mincost.getMinCost(cost, 2, 2)
print("Min cost to reach the dest is \(w)")
