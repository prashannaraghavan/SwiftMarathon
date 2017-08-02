//
//  Tree.swift
//  Trees
//
//  Created by Prashanna Raghavan on 8/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

class BinaryTree
{
    let data:Int
    var left:BinaryTree?
    var right:BinaryTree?
    
    init(_ item:Int) {
        data = item
        left = nil
        right = nil
    }
    
    func inOrder(_ root:BinaryTree?) -> Void {
        if root == nil {
            return
        }
        if (root?.left) != nil
        {
            inOrder(root?.left)
        }
        
        if let value = root?.data
        {
            print("\(value)", terminator:" ")
        }
        
        if (root?.right) != nil
        {
            inOrder(root?.right)
        }
    }
    
    func preOrder(_ root:BinaryTree?) -> Void {
        if root == nil {
            return
        }
        
        if let value = root?.data
        {
            print("\(value)", terminator:" ")
        }
        
        if (root?.left) != nil
        {
            preOrder(root?.left)
        }
        
        if (root?.right) != nil
        {
            preOrder(root?.right)
        }
    }
    
    func postOrder(_ root:BinaryTree?) -> Void {
        if root == nil {
            return
        }
        if (root?.left) != nil
        {
            postOrder(root?.left)
        }
        
        if (root?.right) != nil
        {
            postOrder(root?.right)
        }
        
        if let value = root?.data
        {
            print("\(value)", terminator:" ")
        }
    }
}
