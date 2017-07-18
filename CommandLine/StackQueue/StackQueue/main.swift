//
//  main.swift
//  StackQueue
//
//  Created by Prashanna Raghavan on 7/13/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var stack = Stack()

stack.push(5)
stack.push(6)
stack.push(7)
print(stack.display())
stack.pop()
print(stack.display())
print(stack.peek())

var queue = Queue()
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
print(queue.display())
print(queue.peek())
queue.dequeue()
print(queue.display())
print(queue.peek())
