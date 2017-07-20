//
//  BinomialCooeficient.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class BinomialCoefficient
{
    func getCoefficient(_ x:Int,_ power:Int) -> Int
    {
        if power == 0 || power == x {
            return 1
        }
        else{
            return getCoefficient(x-1,power-1) + getCoefficient(x-1,power)
        }
        
    }
}
