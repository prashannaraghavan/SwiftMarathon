//
//  Level.swift
//  Trees
//
//  Created by Prashanna Raghavan on 8/1/17.
//  Copyright © 2017 ASU. All rights reserved.
//

import Foundation

extension BinaryTree
{
    func height(_ root:BinaryTree?) -> Int {
        if root == nil
        {
            return 0
        }
        
        return 1+max(height(root?.left), height(root?.right))
    }
    
    func printLevel(_ root:BinaryTree?,_ level:Int) -> Void
    {
        if root == nil
        {
            return
        }
        
        if level == 0 {
            if let data = root?.data
            {
                print("\(data)",terminator:" ")
            }
        }
        else{
            printLevel(root?.left, level-1)
            printLevel(root?.right, level-1)
        }
    }
    
    func printLevelOrder(_ root:BinaryTree?) -> Void {
        let ht = height(root)
        
        for i in 0..<ht {
            printLevel(root,i)
        }
    }
    
    func diameter(_ root:BinaryTree?) -> Int {
        if root == nil
        {
            return 0
        }
        
        return max(height(root?.left)+1+height(root?.right),max(diameter(root?.left), diameter(root?.right)))
    }
    
    
}
