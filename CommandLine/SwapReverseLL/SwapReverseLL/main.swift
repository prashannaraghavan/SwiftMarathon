//
//  main.swift
//  SwapReverseLL
//
//  Created by Prashanna Raghavan on 7/14/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Node
{
    var data: Int
    var next: Node?
    
    init(_ value:Int) {
        data = value
    }
}

class LinkedList
{
    var head: Node?
    var tail: Node?
    var length = 0
    
    func isEmpty() -> Bool {
        return length == 0
    }
    
    func create(_ data:Int) -> Node {
        let node = Node(data)
        node.next = nil
        return node
    }
    
    func addLast(_ no:Int) -> Void {
        if isEmpty() {
            head = create(no)
            tail = head
        }
            
        else{
            let oldtail = tail
            let node = create(no)
            oldtail?.next = node
            tail = node
        }
        
        length += 1
    }
    
    func addFirst(_ no:Int) -> Void {
        if isEmpty() {
            head = create(no)
            tail = head
        }
            
        else{
            let oldfirst = head
            let node = create(no)
            node.next = oldfirst
            head = node
        }
        
        length += 1
    }
    
    func returnNodeAt(_ index:Int) -> (Node?,Node?) {
        var headcopy = head
        var prev = head
        var count = 1
        
        while headcopy != nil && count != index {
            prev = headcopy
            headcopy = headcopy?.next
            count += 1
        }
        
        if count == index {
            return (prev,headcopy!)
        }
        
        return (nil,nil)
    }
    
    func addAt(_ no:Int,_ pos:Int) -> Void {
        if pos == 1{
            addFirst(no)
        }
            
        else if pos == length+1
        {
            addLast(no)
        }
            
        else {
            let (previous,current) = returnNodeAt(pos)
            let node = create(no)
            
            guard previous != nil else {
                print("Previous is nil")
                return
            }
            
            guard current != nil else {
                print("Current is nil")
                return
            }
            
            previous?.next = node
            node.next = current
            
            length += 1
        }
    }
    
    func deleteFirst() -> Int
    {
        var item:Int?
        
        if isEmpty()
        {
            print("Nothing to delete")
        }
        else{
            let oldfirst = head
            item = oldfirst?.data
            head = oldfirst?.next
            length -= 1
        }
        
        return item!
    }
    
    func deleteLast() -> Int
    {
        var item:Int?
        
        if isEmpty()
        {
            print("Nothing to delete")
        }
        else{
            item = tail?.data
            let (prev,_) = returnNodeAt(length)
            prev?.next = nil
            tail = prev
            length -= 1
        }
        
        return item!
    }
    
    func deleteAt(_ pos:Int) -> Int {
        
        var item:Int?
        
        if isEmpty()
        {
            print("Nothing to delete")
        }
        else{
            
            switch pos {
            case 1:
                return deleteFirst()
            case length:
                return deleteLast()
            default:
                let (prev,current) = returnNodeAt(pos)
                item = current?.data
                prev?.next = current?.next
                length -= 1
            }
            
        }
        
        return item!
    }
    
    func display() -> [Int] {
        var el = [Int]()
        var copy = head
        while copy != nil {
            el.append((copy?.data)!)
            copy = copy?.next
        }
        return el
    }
}

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
}

var ll = LinkedList()
ll.addFirst(5)
ll.addLast(6)
ll.addLast(7)
ll.addFirst(4)
ll.addFirst(3)
ll.addAt(2,1)
ll.addAt(8,7)
ll.addAt(1,4)
print(ll.display())
ll.swap(5, 4)
print(ll.display())
ll.reverse()
print(ll.display())
ll.addAt(9, 1)
print(ll.display())
ll.reverse()
print(ll.display())
ll.swap(2, 9)
print(ll.display())
ll.swap(3, 9)
print(ll.display())
ll.swap(2, 8)
print(ll.display())
//ll.deleteFirst()
//ll.deleteLast()
//print(ll.display())
//ll.deleteAt(3)
//print(ll.display())
//ll.deleteAt(1)
//print(ll.display())



