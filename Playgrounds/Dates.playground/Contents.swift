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