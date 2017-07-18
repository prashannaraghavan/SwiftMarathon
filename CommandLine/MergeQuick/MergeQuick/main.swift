//
//  main.swift
//  MergeQuick
//
//  Created by Prashanna Raghavan on 7/5/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var quick = QuickSort()
var arr = [5,8,2,3,9,1]
quick.sort(&arr)
for i in arr{
    print(i,terminator:" ")
}

var merge = MergeSort()
var array = [5,8,2,3,9,1]
merge.sort(&array)
print()

for i in array{
    print(i,terminator:" ")
}
