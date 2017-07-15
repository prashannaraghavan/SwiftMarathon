//
//  main.swift
//  DoublyCircular
//
//  Created by Prashanna Raghavan on 7/13/17.
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

class SelfNode
{
    var item:Int
    var next:SelfNode?
    var prev:SelfNode?
    
    init(_ no:Int) {
        item = no
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

var dll = DoublyLinkedList()
dll.addFirst(5)
dll.addFirst(6)
dll.addFirst(7)
dll.addLast(4)
dll.addLast(3)
dll.addLast(2)
print(dll.show())
print(dll.showReverse())
print(dll.peekLast())
print(dll.peekFirst())
dll.addAt(1, 4)
print(dll.show())
print(dll.showReverse())

class CircularLinkedList
{
    var head:SelfNode?
    var tail:SelfNode?
    var length = 0
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func addFirst(_ no:Int) -> Void {
        
        let oldhead = head
        let node = SelfNode(no)
        
        if isEmpty() {
            tail = node
        }
        
        node.next = oldhead
        oldhead?.prev = node
        head = node
        head?.prev = tail
        tail?.next = head
        length += 1
    }
    
    func addLast(_ no:Int) -> Void {
        
        let oldtail = tail
        let node = SelfNode(no)
        
        if isEmpty() {
            head = node
        }
        
        oldtail?.next = node
        node.prev = oldtail
        tail = node
        head?.prev = tail
        tail?.next = head
        length += 1
    }
    
    func addAt(_ no:Int,_ pos:Int) -> Void {
        let node = SelfNode(no)
        
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
        var count = 0
        
        while count != length {
            array.append((headcopy?.item)!)
            headcopy = headcopy?.next
            count += 1
        }
        
        return array
    }
    
    func showReverse() -> [Int] {
        var array = [Int]()
        var tailcopy = tail
        var count = 0
        
        while count != length {
            array.append((tailcopy?.item)!)
            tailcopy = tailcopy?.prev
            count += 1
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

var cll = CircularLinkedList()
cll.addFirst(5)
cll.addFirst(6)
cll.addFirst(7)
cll.addLast(8)
cll.addAt(1, 3)
print(cll.show())
print(cll.showReverse())
print((cll.tail?.next === cll.head) ? "Yes" : "No")
print((cll.head?.prev === cll.tail) ? "Yes" : "No")
print((cll.head?.prev?.item)!)

