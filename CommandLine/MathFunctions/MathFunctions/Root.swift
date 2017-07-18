//
//  Root.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Root
{
    func squareRoot(_ n:Int) -> Double {
        var x = n, y = 1, e = 0.000001
        
        while Double(x - y) > e {
            x = (x + y)/2
            y = n / x
        }
        
        return Double(y)
    }
}
