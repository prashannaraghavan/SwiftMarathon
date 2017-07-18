//
//  Power.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Power{
    func power(_ a:Int,_ b:Int) -> Int {
        if b < 2 {
            return (b == 0) ? 1 : a
        }
        else{
            return a * power(a, b - 1)
        }
    }
}
