//
//  main.swift
//  DynamicProgramming2
//
//  Created by Prashanna Raghavan on 7/18/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var coinchange = CoinChange()
let coinArr = [1,2,3]
let sum = 4
let coins = coinchange.coin(coinArr,coinArr.count,sum)
print("Number of ways the coins can be distributed is : \(coins)")

var binomialCoefficient = BinomialCoefficient()
let x = 4
let power = 2
let coeff = binomialCoefficient.getCoefficient(x, power)
print("Binomial Coefficient is : \(coeff)")

var maxi = MaxSum()
let arr = [1, 101, 2, 3, 100, 4, 5]
let y = maxi.maxSum(arr)
print("Max sum is \(y)")

var egg = EggDrop()
let trials = egg.minimumTrails(2, 10)
print("Minimum Number of trials is \(trials)")
var lps = LongPalindromeSubsequence()
var str = "geeksforgeeks"
let maxlps = lps.lps(str, 0, str.characters.count-1)
print("The longest palindrome subsequence is : \(maxlps)")
