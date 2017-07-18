//
//  main.swift
//  DoublyCircular
//
//  Created by Prashanna Raghavan on 7/13/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

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

