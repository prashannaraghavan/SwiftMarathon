//: Playground - noun: a place where people can play

import UIKit

class Animal
{
    var name = "Donkey"
}

class Donkey:Animal
{
    var don = Animal()
}

class Person  {
    
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    
    func changeFirstName(newFirstName:String) {
        firstName = newFirstName
    }
    
}

var person = Person()


var dict:[String: String] = ["Frog":
    "Kermit", "Pig": "Ms. Piggy",
              "Weirdo": "Gonzo" ]
dict["Weirdo"] = "Felipe"
dict["Frog"] = nil // delete frog
for (type, muppet) in dict {
    print("type: \(type), muppet:\(muppet)")
}
