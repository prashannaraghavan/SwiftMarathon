//
//  main.swift
//  ProtocolDelegate
//
//  Created by Prashanna Raghavan on 7/27/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

protocol DoProtocol: class {
    func vehicleType() -> String
    func vehicleSpeed() -> String
}

class ProtocolClass {
    
    weak var delegate:DoProtocol?
    
    init(with:DoProtocol) {
        delegate = with
        self.triggerFunc()
        self.speedFunc()
    }
    
    deinit {
        print("Deinit called from ProtocolClass")
    }
    
    func triggerFunc() -> Void {
        print("Calling vehicleType delegate")
        let type = delegate?.vehicleType()
        print("Call returned and type is \(type!)")
        print()
    }
    
    func speedFunc() -> Void {
        print("Calling speedFunc delegate")
        let speed = delegate?.vehicleSpeed()
        print("Call returned and speed is \(speed!)")
        print()
    }
}

class DelegateClass:DoProtocol {
    
    weak var pro:ProtocolClass?
    
    init() {
        pro = ProtocolClass(with: self)
    }
    
    deinit {
        print("Deinit called from DelegateClass")
    }
    
    func vehicleSpeed() -> String {
        print("Inside vehicleSpeed of DelegateClass")
        return "45"
    }
    
    func vehicleType() -> String {
        print("Inside vehicleType of DelegateClass")
        return "Car"
    }
}

var delegateObject:DelegateClass?
delegateObject = DelegateClass()
delegateObject = nil
