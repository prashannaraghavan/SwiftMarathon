//
//  Stack.swift
//  StackQueue
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Node{
    
    var item: Int
    var next: Node?
    
    init(_ no:Int) {
        item = no
        next = nil
    }
    
}

class Stack{
    
    var length = 0
    var top: Node?
    
    func isEmpty() -> Bool {
        return length == 0 || top == nil
    }
    
    func push(_ no:Int) -> Void {
        let oldtop = top
        let node = Node(no)
        node.next = oldtop
        top = node
        length += 1
    }
    
    func pop() -> Int? {
        
        if isEmpty() {
            print("Nothing to pop")
            return nil
        }
        else
        {
            let oldtop = top
            top = oldtop?.next
            length -= 1
            return oldtop?.item
        }
    }
    
    func getLength() -> Int {
        return length
    }
    
    func display() -> [Int] {
        var topcopy = top
        var array = [Int]()
        while topcopy != nil {
            array.append((topcopy?.item)!)
            topcopy = topcopy?.next
        }
        return array
    }
    
    func peek() -> Int {
        return (top?.item)!
    }
}
