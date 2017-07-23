//
//  main.swift
//  DivideConquer
//
//  Created by Prashanna Raghavan on 7/20/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var power = Power()
let x = power.calc(2, -2)
print(x)

var find = Median()
let median = find.findMedian([1, 12, 15, 26, 38], [2, 13, 17, 30, 45], 5)
print("Median is \(median)")
