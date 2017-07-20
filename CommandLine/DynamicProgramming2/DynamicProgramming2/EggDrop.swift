//
//  EggDrop.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class EggDrop
{
    func minimumTrails(_ eggs:Int,_ trials:Int) -> Int {
        if trials == 0 || trials == 1{
            return trials
        }
        else if eggs == 1
        {
            return trials
        }
        
        var min = Int.max
        var result = 0
        
        for m in 1..<trials {
            result = max(minimumTrails(eggs-1, m-1),minimumTrails(eggs, trials-m))
            if result < min {
                min = result
            }
        }
        
        return min + 1
    }
}
