//
//  LongPalindromeSubsequence.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/19/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class LongPalindromeSubsequence
{
    func lps(_ str:String,_ start:Int,_ end:Int) -> Int {
        
        let chararr = Array(str.characters)
        
        if str.characters.count <= 0 {
            return 0
        }
        else if start >= end
        {
            return 1
        }
        else if chararr[start] == chararr[end] && start+1 == end
        {
            return 2
        }
        else if chararr[start] == chararr[end]
        {
            return lps(str,start+1,end-1) + 2
        }
        
        return max(lps(str,start+1,end),lps(str,start,end-1))
    }
}

