//
//  main.swift
//  SortSearch
//
//  Created by Prashanna Raghavan on 7/6/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var merge = MergeSort()
var arr = [6,4,3,2,8,1,9,5,0,7]
var aux = Array(repeating: 0, count: arr.count)
merge.sort(&arr,&aux,0,arr.count-1)

print(arr)

var bin = BinarySearch()
print(bin.find(arr,0,arr.count-1,7) ? "Yes" : "No")
