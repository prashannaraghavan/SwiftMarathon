//
//  DoublyLinkedList.swift
//  DoublyCircular
//
//  Created by Prashanna Raghavan on 7/17/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Node
{
    var item:Int
    var next:Node?
    var prev:Node?
    
    init(_ no:Int) {
        item = no
        prev = nil
        next = nil
    }
}

class DoublyLinkedList
{
    var head:Node?
    var tail:Node?
    var length = 0
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func addFirst(_ no:Int) -> Void {
        
        let oldhead = head
        let node = Node(no)
        
        if isEmpty() {
            tail = node
        }
        
        node.next = oldhead
        oldhead?.prev = node
        head = node
        length += 1
    }
    
    func addLast(_ no:Int) -> Void {
        
        let oldtail = tail
        let node = Node(no)
        
        if isEmpty() {
            head = node
        }
        
        oldtail?.next = node
        node.prev = oldtail
        tail = node
        length += 1
    }
    
    func addAt(_ no:Int,_ pos:Int) -> Void {
        let node = Node(no)
        
        if pos == 1 {
            addFirst(no)
        }
        else if pos == length+1 {
            addLast(no)
        }
        else if pos <= length
        {
            var count = 1
            var current = head
            var prev = head
            
            while current != nil && count < pos{
                prev = current
                current = current?.next
                count += 1
            }
            
            prev?.next = node
            current?.prev = node
            node.prev = prev
            node.next = current
            length += 1
        }
    }
    
    func show() -> [Int] {
        var array = [Int]()
        var headcopy = head
        
        while headcopy != nil {
            array.append((headcopy?.item)!)
            headcopy = headcopy?.next
        }
        
        return array
    }
    
    func showReverse() -> [Int] {
        var array = [Int]()
        var tailcopy = tail
        
        while tailcopy != nil {
            array.append((tailcopy?.item)!)
            tailcopy = tailcopy?.prev
        }
        
        return array
    }
    
    func peekFirst() -> Int
    {
        return (head?.item)!
    }
    
    func peekLast() -> Int
    {
        return (tail?.item)!
    }
    
    func getLength() -> Int {
        return length
    }
}
