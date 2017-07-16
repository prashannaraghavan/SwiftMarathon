//
//  main.swift
//  SwapReverseLL
//
//  Created by Prashanna Raghavan on 7/14/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var ll = LinkedList()
ll.addFirst(5)
ll.addLast(6)
ll.addLast(7)
ll.addFirst(4)
ll.addFirst(3)
ll.addAt(2,1)
ll.addAt(8,7)
ll.addAt(1,4)

//ll.deleteFirst()
//ll.deleteLast()
//print(ll.display())
//ll.deleteAt(3)
//print(ll.display())
//ll.deleteAt(1)
//print(ll.display())

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
ll.head = ll.reverseInGroups(ll.head, 3)
print(ll.display())





