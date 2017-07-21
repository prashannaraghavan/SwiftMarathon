//
//  main.swift
//  DivideConquer
//
//  Created by Prashanna Raghavan on 7/20/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Power
{
    func calc(_ x:Int,_ power:Int) -> Double{
        if power == 0
        {
            return 1
        }
        
        let temp = calc(x, power/2)
        
        if(power%2 == 0)
        {
            return temp*temp
        }
        
        if power > 0 {
            return Double(x)*temp*temp
        }
        
        return (temp*temp)/Double(x)
    }
}

var power = Power()
let x = power.calc(2, -2)
print(x)
