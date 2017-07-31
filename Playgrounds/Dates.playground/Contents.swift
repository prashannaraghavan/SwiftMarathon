//: Playground - noun: a place where people can play

import UIKit

let today = Date()
let format = DateFormatter()

format.locale = .current

format.dateStyle = .long
format.dateFormat = "EEEE, MMMM dd, yyyy HH:mm:ss zzz GG"
let longFormattedDate = format.string(from: today)

format.dateStyle = .full
let fullFormattedDate = format.string(from: today)

format.dateStyle = .medium
let mediumFormattedDate = format.string(from: today)

format.dateStyle = .short
let shortFormattedDate = format.string(from: today)

let calendar = Calendar.current
let dateComponents = calendar.dateComponents([.day, .month, .year, .weekOfYear, .hour, .minute, .second, .nanosecond], from: today)

print("day = \(String(describing: dateComponents.day))", "month = \(String(describing: dateComponents.month))", "year = \(String(describing: dateComponents.year))", "week of year = \(String(describing: dateComponents.weekOfYear))", "hour = \(String(describing: dateComponents.hour))", "minute = \(String(describing: dateComponents.minute))", "second = \(String(describing: dateComponents.second))", "nanosecond = \(String(describing: dateComponents.nanosecond))" , separator: ", ", terminator: "")

var components = DateComponents()
components.day = 24
components.month = 09
components.year = 1989
components.hour = 16
components.minute = 32
components.timeZone = TimeZone(abbreviation: "IST")
let birthDate = calendar.date(from:components)

components.timeZone = TimeZone(abbreviation: "GMT")
var newDate = calendar.date(from:components)

components.timeZone = TimeZone(abbreviation: "CST")
newDate = calendar.date(from:components)

components.timeZone = TimeZone(abbreviation: "MST")
newDate = calendar.date(from:components)

var diffDateComponents = Calendar.current.dateComponents([.day, .month, .year, .weekOfYear, .hour, .minute, .second, .nanosecond], from: birthDate!, to: today)

print("The difference between dates is: \(String(describing: diffDateComponents.year)) years, \(String(describing: diffDateComponents.month)) months, \(String(describing: diffDateComponents.day)) days, \(String(describing: diffDateComponents.hour)) hours, \(String(describing: diffDateComponents.minute)) minutes, \(String(describing: diffDateComponents.second)) seconds")

let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.unitsStyle = .full

let interval = today.timeIntervalSince(birthDate!)
dateComponentsFormatter.string(from:interval)

dateComponentsFormatter.allowedUnits = [.day, .hour, .minute]
let autoFormattedDifference = dateComponentsFormatter.string(from:birthDate!, to: today)

struct Bag{
    var items = [Int]()
    
    mutating func add(item:Int) -> Void {
        items.append(item)
    }
    
    func display()
    {
        print(items)
    }
}

var bag = Bag()
bag.add(item: 5)
bag.add(item: 6)
bag.add(item: 7)
bag.add(item: 8)
bag.display()

//Optional binding
let string:String? = nil
if let str = string{
    print(str)
}
else{
    print("Value is nil")
}

//Forced unwrapping
if string != nil {
    print(string!)
}
else{
    print("Value is nil")
}

//String <==> character array
let word = "Establishmentarian"
let wordArr = Array(word.characters)
let wordAgain = String(wordArr)
//String array <==> String
let sentence = "My name is Prashanna"
let sentenceArr = Array(sentence.components(separatedBy: " "))
let sentenceAgain = sentenceArr.joined(separator: " ")

/* 
 Swift value types are never mutable
 ex: Array, Dictionary, All primitive type declared as struct
 To make it possible add mutating keyword before the function definition
 */
var arr1 = [1,4,3,2,6]
var arr2 = arr1
arr2.append(7)
print(arr2)
print(arr1)

//Cast
let age = 20
let height = 170.5
let weight = 65.5
let total = Double(age)+height+weight

//Nil-Coalescing operator
let value:Int? = nil
let defaultValue = value ?? 0

//1 to 10
for i in 1...10
{
    print(i,terminator: "")
}
print()
var j=1
while j<=10 {
    print(j,terminator:"")
    j += 1
}
print()
var k = 1
repeat{
    print(k,terminator:"")
    k += 1
}while k<=10
print()

//10 t0 1
for l in stride(from: 10, through: 1, by: -1)
{
    print(l,terminator: "")
}

var stri = "String"
var str2 = stri
str2 = "New "+stri
print(stri)
print(str2)