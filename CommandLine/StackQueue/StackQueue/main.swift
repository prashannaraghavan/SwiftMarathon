//
//  main.swift
//  StackQueue
//
//  Created by Prashanna Raghavan on 7/13/17.
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

var stack = Stack()

stack.push(5)
stack.push(6)
stack.push(7)
print(stack.display())
stack.pop()
print(stack.display())
print(stack.peek())

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

var queue = Queue()
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
print(queue.display())
print(queue.peek())
queue.dequeue()
print(queue.display())
print(queue.peek())
