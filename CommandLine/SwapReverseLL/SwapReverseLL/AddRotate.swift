//
//  AddRotate.swift
//  SwapReverseLL
//
//  Created by Prashanna Raghavan on 7/15/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

extension LinkedList
{
    func display(_ head:Node?) -> [Int] {
        var el = [Int]()
        var copy = head
        while copy != nil {
            el.append((copy?.data)!)
            copy = copy?.next
        }
        return el
    }
    
    func add(_ a:Node?,_ b:Node?) -> Node {
        
        var sum = 0
        var carry = 0
        var left = a,right = b
        var result: Node?
        
        while left !== nil || right !== nil
        {
            sum = (left?.data ?? 0) + (right?.data ?? 0) + carry
            
            carry = (sum >= 10) ? sum/10 : 0
            
            sum %= 10
            
            if(result == nil)
            {
                result = Node(sum)
            }
            else
            {
                let newNode = Node(sum)
                newNode.next = result
                result = newNode
            }
            
            if left?.next == nil && right?.next == nil {
                break
            }
            
            if left?.next != nil {
                left = left?.next!
            }

            if right?.next != nil {
                right = right?.next!
            }
        }
        
        if carry > 0 {
            let newNode = Node(carry)
            newNode.next = result
            result = newNode
        }
        
        return result!
    }
    
    func rotate(_ h:Node?,_ no:Int) -> Void {
        
        var count = 1
        var curr = h
        
        while curr != nil && count<no {
            curr = curr?.next!
            count += 1
        }
        
        if curr == nil {
            return
        }
        
        let nthNode = curr
        
        while curr?.next !== nil {
            curr = curr?.next!
        }
        
        curr?.next = head
        head = nthNode?.next
        nthNode?.next = nil
    }
}
