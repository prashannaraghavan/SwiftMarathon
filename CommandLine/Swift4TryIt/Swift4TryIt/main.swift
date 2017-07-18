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
                let rand = Int(arc4random_uniform(UInt32(Int(winners.count))))
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


var str = "String"
var charArr = Array(str.characters)
print(charArr)

let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])
// G
print(greeting[greeting.index(before: greeting.endIndex)])
// !
print(greeting[greeting.index(after: greeting.startIndex)])
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])
// a

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

//welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

print(houseAnimals.isSubset(of: farmAnimals) ? "Yes" : "No")
// true
print(farmAnimals.isSuperset(of: houseAnimals) ? "Yes" : "No")
// true
print(farmAnimals.isDisjoint(with: cityAnimals) ? "Yes" : "No")
// true
print(farmAnimals.isStrictSuperset(of: houseAnimals) ? "Yes" : "No")

let base = 2
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

