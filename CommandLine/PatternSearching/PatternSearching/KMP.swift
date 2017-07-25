//
//  KMP.swift
//  PatternSearching
//
//  Created by Prashanna Raghavan on 7/24/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class KMPSearch
{
    func getlps(_ string:[Character],_ pattern:[Character],_ length:Int) -> [Int] {
        var arr = Array(repeating: -1, count: length)
        var i = 1, len = 0
        arr[0] = 0
        
        while i < length {
            if string[i] == pattern[len] {
                len += 1
                arr[i] = len
                i += 1
            }
            else
            {
                if len != 0 {
                    arr[len] = len - 1
                }
                else{
                    arr[i] = len
                    i += 1
                }
            }
        }
        
        return arr
    }
    
    func find(string: [Character],pattern: [Character]) -> Void
    {
        var i = 0, j = 0
        let n = string.count
        let m = pattern.count
        
        let lpsarr = getlps(string,pattern,m)
        
        i = 0
        
        while i < n {
            if string[i] == pattern[j] {
                i += 1
                j += 1
            }
            
            if j == m {
                print("Pattern \(String(pattern)) found at index : \(i-j)")
                j = lpsarr[j-1]
            }
            else if i < n && string[i] != pattern[j]{
                if j != 0 {
                    j = lpsarr[j-1]
                }
                else{
                    i += 1
                }
                
            }
        }
    }
}
