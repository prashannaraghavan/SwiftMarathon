//
//  PermutationCombination.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Permutation{
    func fact(_ a:Int) -> Int {
        if a == 0 {
            return 1
        }
        else{
            return a*fact(a-1)
        }
    }
    
    func nPr(_ n:Int,_ r:Int) -> Int {
        return fact(n)/fact(n-r)
    }
    
    func nCr(_ n:Int,_ r:Int) -> Int {
        return fact(n)/(fact(n-r) * fact(r))
    }
}
