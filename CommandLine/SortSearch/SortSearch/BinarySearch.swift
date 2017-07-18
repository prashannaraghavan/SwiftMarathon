//
//  BinarySearch.swift
//  SortSearch
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class BinarySearch
{
    func find(_ arr:[Int],_ start:Int,_ end:Int,_ no:Int) -> Bool {
        
        if start >= end {
            return false
        }
        
        let mid = start + (end-start)/2
        
        if arr[mid] == no {
            return true
        }
        else if arr[mid] > no {
            return find(arr,start,mid-1,no)
        }
        else if arr[mid] < no {
            return find(arr,mid+1,end,no)
        }
        
        return false
    }
}
