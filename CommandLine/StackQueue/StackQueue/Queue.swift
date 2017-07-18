//
//  Queue.swift
//  StackQueue
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Queue{
    
    var head:Node?
    var tail:Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func enqueue(_ no:Int) -> Void {
        
        let node = Node(no)
        
        if isEmpty() {
            let oldhead = head
            node.next = oldhead
            head = node
            tail = node
        }
            
        else{
            let oldhead = head
            node.next = oldhead
            head = node
        }
    }
    
    func display() -> [Int] {
        var topcopy = head
        var array = [Int]()
        while topcopy != nil {
            array.append((topcopy?.item)!)
            topcopy = topcopy?.next
        }
        return array
    }
    
    func peek() -> Int {
        return (tail?.item)!
    }
    
    func getPrevCurr() -> Node? {
        
        var topcopy = head
        var prev = head
        
        while topcopy?.next != nil {
            prev = topcopy
            topcopy = topcopy?.next
        }
        
        return prev
    }
    
    func dequeue() -> Void{
        let prev = getPrevCurr()
        prev?.next = nil
        tail = prev
    }
}
