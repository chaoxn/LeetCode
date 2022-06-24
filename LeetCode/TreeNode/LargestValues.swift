//
//  LargestValues.swift
//  LeetCode
//
//  Created by Admin on 2022/6/24.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//515. 在每个树行中找最大值
func largestValues(_ root: TreeNode?) -> [Int] {
    
    var res = [Int]()
    
    guard root != nil else {
        return []
    }
    
    var queue = [root!]
    
    while !queue.isEmpty {
            
        var levelMax = Int.min
        
        for _ in 0..<queue.count {
            let temp = queue.removeFirst()
            
            levelMax = max(levelMax, temp.val)
            
            if temp.left != nil {
                queue.append(temp.left!)
            }
            if temp.right != nil {
                queue.append(temp.right!)
            }
        }
        res.append(levelMax)
    }
    
    return res
}
