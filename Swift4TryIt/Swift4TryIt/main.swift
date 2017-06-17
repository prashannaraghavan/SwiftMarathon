//
//  main.swift
//  Swift4TryIt
//
//  Created by Prashanna Raghavan on 6/16/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

print("Hello, World!")

let range = 0..<5
print(range.contains(4) ? "Yes" : "No")

print("Linkedlist program start")
print("************************")
class Node
{
    var data: Int?
    var next: Node?
    
    init(item: Int) {
        data = item
        next = nil
    }
}

class LinkedList
{
    var head: Node!
    var last: Node!
    
    func add(data: Int) -> Void {
        
        let oldfirst = head
        let node = Node(item: data)
        node.next = oldfirst
        head = node
    }
    
    func addLast(data: Int) -> Void {
        
        var oldlast = last
        let node = Node(item: data)
        if oldlast == nil
        {
            oldlast = node
            head = node
        }
        else{
            oldlast?.next = node
        }
        
        last = node
    }
    
    func printList() -> Void {
        while head != nil
        {
            print(head.data!, terminator:" ")
            head = head.next
        }
        print()
    }
}

var ll = LinkedList()
ll.add(data: 5)
ll.add(data: 4)
ll.add(data: 3)
ll.add(data: 2)
ll.printList()

var lll = LinkedList()
lll.addLast(data: 5)
lll.addLast(data: 4)
lll.addLast(data: 3)
lll.addLast(data: 2)
lll.printList()
print("************************")

var rand = arc4random_uniform(100)
print(rand)

class WWDC
{
    var max: Int
    var winners: [String]
    
    init(seats: Int) {
        max = seats
        winners = []
    }
    
    func enter(entry: String) -> Void {
        winners.append(entry)
    }
    
    func finalList() -> [String] {
        
        var list = Array<String>()
        
        if winners.count > max {
            for _ in 0..<max
            {
                let rand = Int(arc4random_uniform(100))
                list.append(winners[rand])
            }
            
            return list
        }
        else {
            return winners
        }
    }
}

let WWDCA = WWDC(seats: 2)
print("The winners are \(WWDCA.finalList().joined(separator: " "))")

let WWDCB = WWDC(seats: 2)
WWDCB.enter(entry: "John@apple.com")
WWDCB.enter(entry: "Paul@apple.com")
print("The winners are \(WWDCB.finalList().joined(separator: " "))")

let WWDCC = WWDC(seats: 8)
for i in 0..<50
{
    WWDCC.enter(entry: "John\(i)@apple.com")
    WWDCC.enter(entry: "Paul\(i)@apple.com")
}
print("The winners are \(WWDCC.finalList().joined(separator: " "))")


