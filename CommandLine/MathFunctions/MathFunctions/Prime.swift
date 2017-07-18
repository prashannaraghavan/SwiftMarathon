//
//  Prime.swift
//  MathFunctions
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Prime
{
    init(_ number:Int) {
        display(number)
    }
    
    func display(_ number:Int) -> Void {
        
        var flag = [Bool](repeating: true, count: number)
        let range = Int(sqrt(Double(number)))
        
        for i in stride(from: 2, to: range, by: 1)
        {
            if flag[i] == true {
                for j in stride(from: 2*i, to: number, by: i) {
                    flag[j] = false
                }
            }
        }
        
        for i in stride(from: 2, to: number, by: 1)
        {
            if flag[i] == true {
                print(i,terminator: " ")
            }
        }
        print()
    }
}
