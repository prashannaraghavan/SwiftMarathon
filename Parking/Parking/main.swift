//
//  main.swift
//  Parking
//
//  Created by Prashanna Raghavan on 7/5/17.
//  Copyright © 2017 ASU. All rights reserved.
//

/**
 Total spots in the parking structure: 1000
 Rates:
 - Open: 8am and close: 10pm
 - Free up to 3 hrs.
 - 5$ per hr charge after 3 hrs (starts charging from the 4th hour) up to max of 25$.
 */

import Foundation

// helper method
func createDate(month: Int, day: Int, year: Int, hour: Int, minute: Int, second: Int? = 0) -> Date {
    let dateComponents = NSDateComponents()
    dateComponents.month = month
    dateComponents.day = day
    dateComponents.year = year
    dateComponents.hour = hour
    dateComponents.minute = minute
    dateComponents.second = second!
    
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    return calendar!.date(from: dateComponents as DateComponents)!
}

func assertBoolean(actual: Bool, expected: Bool) {
    print(actual == expected)
}

func assert(actual: Int, expected: Int) {
    print(actual == expected)
}

protocol ParkingSystemType {
    
    /*
     Current total number of available parking spots in the structure
     
     @return Int - indicates how much spots are currently
     available in the structure
     */
    func currentAvailableSpots() -> Int
    
    /*
     Record the vehicles enterring the parking structure with its license number and in time
     
     @params licenseNumber - unqiue identifier of each vehicle
     @params inTime - the in time of the vehicle
     
     @return Bool - if the vehicle is allowed and successfully enter the parking lot
     */
    func vehicleEnter(licenseNumber: String, inTime: Date) -> Bool
    
    /*
     Calculate and record the payment the owner is making.
     
     @params licenseNumber - unqiue identifier of each vehicle
     @params outTime - the out time of the vehicle
     
     @return Int - The amount of the owner has paid
     */
    func vehicleCheckout(licenseNumber: String, outTime: Date) -> Int
    
    /*
     Vehicle is leaving the parking lot. Vehicle can only leave the parking lot
     after the payment is made.
     
     @params licenseNumber - unqiue identifier of each vehicle
     
     @return Bool - if the vehicle is allowed and can leave the parking lot
     */
    func vehicleExit(licenseNumber: String) -> Bool
}

// your implementation goes here.

class ParkingSystem:ParkingSystemType
{
    var spots = 1000
    var vehicleTime = [String:Date]()
    var amountTrack = [String:Int]()
    
    func currentAvailableSpots() -> Int
    {
        return spots
    }
    
    func vehicleEnter(licenseNumber: String, inTime: Date) -> Bool
    {
        if spots > 0
        {
            spots -= 1
            vehicleTime[licenseNumber] = inTime
            amountTrack[licenseNumber] = -1
            return true
        }
        
        return false
    }
    
    func vehicleCheckout(licenseNumber: String, outTime: Date) -> Int
    {
        let inTime = vehicleTime[licenseNumber]
        
        var inTimecomponents = Calendar.current.dateComponents([.hour, .minute], from: inTime!)
        var outTimecomponents = Calendar.current.dateComponents([.hour, .minute], from: outTime)
        // return (components.hour!, components.minute!)
        
        let inTimeHour = inTimecomponents.hour!
        let inTimeMinutes = inTimecomponents.minute!
        
        let outTimeHour = outTimecomponents.hour!
        let outTimeMinutes = outTimecomponents.minute!
        
        let totalOutMinutes = (outTimeHour*60) + outTimeMinutes
        let totalInMinutes = (inTimeHour*60) + inTimeMinutes
        
        let duration = (totalOutMinutes - totalInMinutes)/60
        
        if duration <= 3
        {
            amountTrack[licenseNumber] = 0
            return 0
        }
        else
        {
            let amount = ((duration-3)*5 < 25) ? (duration-3)*5 : 25
            amountTrack[licenseNumber] = amount
            return amount
        }
    }
    
    func vehicleExit(licenseNumber: String) -> Bool
    {
        if vehicleTime.keys.contains(licenseNumber) && amountTrack[licenseNumber] != -1
        {
            spots += 1
            vehicleTime[licenseNumber] = nil
            amountTrack[licenseNumber] = nil
            return true
        }
        
        return false
    }
}

// sample test cases
let parkingSystem: ParkingSystemType = ParkingSystem()

let vehicleOne = "6CD189A"
let vehicleTwo = "5AD1123A"


let now = Date()
// Vehicle one entering the parking lot
parkingSystem.vehicleEnter(licenseNumber: vehicleOne, inTime: now)
assert(actual: parkingSystem.currentAvailableSpots(), expected: 999)

// Vehicle two entering the parking lot
let thirtyMinutesLater = now.addingTimeInterval(60*30)
parkingSystem.vehicleEnter(licenseNumber: vehicleTwo, inTime: thirtyMinutesLater)
assert(actual: parkingSystem.currentAvailableSpots(), expected: 998)

// Vehicle one checkout and leaving the parking lot
let twoHours = now.addingTimeInterval(60*60*2)
let rev1 = parkingSystem.vehicleCheckout(licenseNumber: vehicleOne, outTime: twoHours)
assert(actual: rev1, expected: 0)
assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleOne), expected: true)
assert(actual: parkingSystem.currentAvailableSpots(), expected: 999)

// Vehicle two trying to leave without paying
assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleTwo), expected: false)

// Vehicle two checkout
let fiveHours = thirtyMinutesLater.addingTimeInterval(60*60*5)
let rev2 = parkingSystem.vehicleCheckout(licenseNumber: vehicleTwo, outTime: fiveHours)
assert(actual: rev2, expected: 10)

// Vehicle two leaving the parking lot
assertBoolean(actual: parkingSystem.vehicleExit(licenseNumber: vehicleTwo), expected: true)
assert(actual: parkingSystem.currentAvailableSpots(), expected: 1000)





