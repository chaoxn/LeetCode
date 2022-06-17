//
//  MinSubArrayLen.swift
//  LeetCode
//
//  Created by chaox on 2022/6/16.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//209长度最小子数组  滑动窗口
/**
 s = 7, nums = [2,3,1,2,4,3] 输出：2 解释：子数组 [4,3] 是该条件下的长度最小的子数组
 */
func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    
    var left = 0
    var res = Int.max
    var sum = 0
    
    for right in 0..<nums.count {
        
        sum += nums[right]
        
        while sum >= target {
            //记录子数组长度
            res = min(res, right - left + 1)
            //如果大于目标值,缩进左边界
            sum -= nums[left]
            left += 1
        }
    }
    
    return res == Int.max ? 0 : res
}
