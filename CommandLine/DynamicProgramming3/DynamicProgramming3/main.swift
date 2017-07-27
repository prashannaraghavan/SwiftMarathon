//
//  main.swift
//  DynamicProgramming3
//
//  Created by Prashanna Raghavan on 7/26/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var arr = [1,-4,5,6,3,-3,-2]
var maxi = MaxSlidingSum()
let sum = maxi.find(arr)
var arr1 = [-1,-4,-5,-6,-3,-3,-2]
let sum1 = maxi.findMaxInNeg(arr1)
print("Maximum sum in a contiguous array is \(sum) \(sum1)")

