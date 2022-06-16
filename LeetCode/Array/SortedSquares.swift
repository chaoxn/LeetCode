//
//  SortedSquares.swift
//  LeetCode
//
//  Created by chaox on 2022/6/16.
//  Copyright © 2022 ios. All rights reserved.
//

//977
/**
 输入：nums = [-4,-1,0,3,10]
 输出：[0,1,9,16,100]
 */
func sortedSquares_1(_ nums: [Int]) -> [Int] {
    var res = [Int]()
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        
        let leftValue = nums[left] * nums[left]
        let rightValue = nums[right] * nums[right]
        
        if  leftValue >= rightValue{
            res.append(leftValue)
            left += 1
        }else{
            res.append(rightValue)
            right -= 1
        }
    }
    
    return res.reversed()
}
