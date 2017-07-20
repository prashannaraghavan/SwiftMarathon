//
//  CoinChange.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class CoinChange
{
    func coin(_ coinArr:[Int],_ length:Int,_ sum:Int) -> Int {
        if sum == 0 {
            return 1
        }
        else if sum < 0
        {
            return 0
        }
        else if length <= 0 && sum > 0
        {
            return 0
        }
        else{
            return coin(coinArr,length-1,sum) + coin(coinArr,length,sum-coinArr[length-1])
        }
    }
}
