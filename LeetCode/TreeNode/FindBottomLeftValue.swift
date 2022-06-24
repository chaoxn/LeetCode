//
//  FindBottomLeftValue.swift
//  LeetCode
//
//  Created by Admin on 2022/6/22.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//513找树左下角的值
func findBottomLeftValue(_ root: TreeNode?) -> Int {

    var res = [[Int]]()
    var queue = [root!]
    
    while !queue.isEmpty{
        var levelArray = [Int]()
        for _ in 0..<queue.count{
            let temp = queue.removeFirst()
            levelArray.append(temp.val)
            if (temp.left != nil) {
                queue.append(temp.left!)
            }
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }
        res.append(levelArray)
    }
    
    return res.last![0]
}
