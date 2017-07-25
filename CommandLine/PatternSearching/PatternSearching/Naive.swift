//
//  Naive.swift
//  PatternSearching
//
//  Created by Prashanna Raghavan on 7/24/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class PatternSearch
{
    func find(string: [Character],pattern: [Character]) -> (Bool,[Character],Int)
    {
        let n = string.count
        let m = pattern.count
        var flag = true
        
        for i in 0..<n-m+1 {
            for j in 0..<m {
                if string[i+j] != pattern[j] {
                    flag = false
                }
            }
            
            if flag == true {
                return (true,pattern,i)
            }
            
            flag = true
        }
        
        return (false,[],-1)
    }
}
