//
//  main.swift
//  PatternSearching
//
//  Created by Prashanna Raghavan on 7/24/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var naive = PatternSearch()
let string = "PRASHANNA"
let pattern = "PRAS"
let index = naive.find(string: Array(string.characters), pattern: Array(pattern.characters))
if index.0 == true
{
    print("Pattern \(String(index.1)) found at index : \(index.2)")
}
else{
    print("Pattern \(pattern) not found")
}

var kmp = KMPSearch()
let str = "SHAWSHANK"
let pat = "SHA"
kmp.find(string: Array(str.characters), pattern: Array(pat.characters))

extension Character
{
    func unicodeScalarCodePoint() -> UInt32
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}

class RobinKarp
{
    var hash = 256
    
    func find(string: [Character],pattern: [Character],prime:Int) -> Void
    {
        let n = string.count
        let m = pattern.count
        
        var p = 0, q = 0
        var h = 1
        
        for _ in 0..<m {
            h = (h*hash) % prime
        }
        
        for i in 0..<m {
            p = (hash*p + Int(string[i].unicodeScalarCodePoint())) % prime
            q = (hash*q + Int(pattern[i].unicodeScalarCodePoint())) % prime
        }
        
        var x = 0
        while x <= n-m {
            if p == q {
                var y = 0
                while y < m
                {
                    let w = x+y
                    if string[w] != pattern[y] {
                        break
                    }
                    y += 1
                }
                
                if y == m {
                    print("Found pattern \(String(pattern)) at index \(x)")
                }
            }
            
            if x < n-m {
                let z = x+m
                p = (hash*(p - h*Int(string[x].unicodeScalarCodePoint())) + Int(string[z].unicodeScalarCodePoint())) % prime
                
                if p < 0 {
                    p = p + prime
                }
            }
            
            x += 1
        }
    }
    
    func findIndices(string: String,pattern: String) -> Void
    {
        let n = string.characters.count
        let m = pattern.characters.count
        
        let prange = pattern.index(pattern.startIndex, offsetBy: 0)..<pattern.index(pattern.startIndex, offsetBy: m)
        let psub = pattern.substring(with: prange)
        
        let str = Array(string.characters)
        let pat = Array(pattern.characters)
        
        var x = 0
        while x <= n-m {
            let srange = string.index(string.startIndex, offsetBy: x)..<string.index(string.startIndex, offsetBy: x+m)
            let ssub = string.substring(with: srange)

            if psub.hashValue == ssub.hashValue {
                var y = 0
                while y < m
                {
                    let w = x+y
                    if str[w] != pat[y] {
                        break
                    }
                    y += 1
                }
                
                if y == m {
                    print("Found pattern \(String(pat)) at index \(x)")
                }
            }
            
            x += 1
        }
    }
}

var rk = RobinKarp()
let str1 = "SHAWSHANK"
let pat1 = "SHA"
//rk.find(string: Array(str1.characters), pattern: Array(pat1.characters),prime: 101)
rk.findIndices(string: str1, pattern: pat1)
