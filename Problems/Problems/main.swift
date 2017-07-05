//
//  main.swift
//  Problems
//
//  Created by Prashanna Raghavan on 7/5/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class TwoSum: NSObject {
    
    func twosumFunc(_ arr:[Int],_ sum:Int) -> (Int,Int) {
        
        var i = 0,j = arr.count-1
        while i < arr.count,j >= 0 {
            if sum < arr[i] + arr[j] {
                j -= 1
            }
            else if sum > arr[i] + arr[j] {
                i += 1
            }
            else {
                return (arr[i],arr[j])
            }
        }
        return (0,0)
    }
    
    func find(_ arr:[Int],_ sum:Int) -> (Int,Int) {
        let newarr = arr.sorted(by: {$0 < $1})
        return twosumFunc(newarr,sum)
    }
}

var twoSum = TwoSum()
let arr = [4,9,3,8,2]
print(twoSum.find(arr,7))

