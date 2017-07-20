//
//  Permutation.swift
//  BackTracking
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Permutation{
    func permute(_ char:inout [Character],_ start:Int,_ end:Int) -> Void {
        if start >= end {
            print(String(char))
        }
        
        for i in start..<end {
            if i != start {
                swap(&char[i], &char[start])
            }
            permute(&char, start+1, end)
            if i != start {
                swap(&char[i], &char[start])
            }
        }
    }
}
