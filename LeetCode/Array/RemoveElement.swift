//
//  RemoveElement.swift
//  LeetCode
//
//  Created by chaox on 2022/6/15.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//27移除元素
func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

    //快慢指针
    var slowIndex = 0
    for (fastIndex,value) in nums.enumerated() {
        if value != val {
            nums[slowIndex] = nums[fastIndex]
            slowIndex += 1
        }
    }
    
    return slowIndex
}
