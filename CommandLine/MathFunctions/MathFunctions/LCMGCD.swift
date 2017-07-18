//
//  LCMGCD.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class LCM
{
    func lcm(_ a:Int,_ b:Int) -> Int {
        if b == 0 {
            return a
        }
        else
        {
            return lcm(b, a % b)
        }
    }
    
    func gcd(_ a:Int,_ b:Int) -> Int {
        if b == 0 {
            return 0
        }
            
        else
        {
            return (a*b)/lcm(a,b)
        }
    }
}
