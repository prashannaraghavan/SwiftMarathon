//
//  SwapReverse.swift
//  SwapReverseLL
//
//  Created by Prashanna Raghavan on 7/15/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

extension LinkedList
{
    func swap(_ a:Int,_ b:Int) -> Void {
        
        var prevA:Node?
        var currA = head
        
        while currA != nil && currA?.data != a{
            prevA = currA
            currA = currA?.next
        }
        
        var prevB:Node?
        var currB = head
        
        while currB != nil && currB?.data != b{
            prevB = currB
            currB = currB?.next
        }
        
        if prevA != nil {
            prevA?.next = currB
        }
        else{
            head = currB
        }
        
        if prevB != nil {
            prevB?.next = currA
        }
        else{
            head = currA
        }
        
        let temp = currA?.next
        currA?.next = currB?.next
        currB?.next = temp
    }
    
    func reverse() -> Void {
        var prev:Node?
        var curr = head
        
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }
        
        head = prev
    }
    
    func reverseInGroups(_ h:Node?,_ no:Int) -> Node
    {
        var prev:Node?
        var curr = h
        var next:Node?
        var count = 0
        
        while curr != nil && count < no{
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
            count += 1
        }
        
        if next != nil {
            h?.next = reverseInGroups(next,no)
        }
        
        return prev!
    }
}
