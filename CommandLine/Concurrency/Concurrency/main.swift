//
//  main.swift
//  Concurrency
//
//  Created by Prashanna Raghavan on 8/6/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class Concurrency
{
    func start()
    {
        let queue = DispatchQueue(label: "com.mycompany.simpleQueue", qos: DispatchQoS.utility)
        let queue1 = DispatchQueue(label: "com.mycompany.normalQueue", qos: DispatchQoS.utility)
        
        queue.async {
            for i in 1...10
            {
                print("Queue: \(i)")
            }
        }
        
        queue1.async {
            for j in 1...10 {
                print("Normal: \(j)")
            }
        }
        
        queue.activate()
        queue1.activate()
    }
}

var concurrency = Concurrency()
concurrency.start()

