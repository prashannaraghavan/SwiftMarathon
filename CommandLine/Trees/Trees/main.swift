//
//  main.swift
//  Trees
//
//  Created by Prashanna Raghavan on 8/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

var root = BinaryTree(1)
root.left = BinaryTree(2)
root.right = BinaryTree(3)
root.left?.left = BinaryTree(4)
root.left?.right = BinaryTree(5)

print("InOrder :",terminator:" ")
root.inOrder(root)
print()
print("PreOrder :",terminator:" ")
root.preOrder(root)
print()
print("PostOrder :",terminator:" ")
root.postOrder(root)
print()
