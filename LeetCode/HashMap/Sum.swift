//
//  Sum.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//1. 两数之和
func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map = [Int:Int]()
    for i in 0..<nums.count {
        let m = nums[i]
        let n = target - nums[i]
        
        if let j = map[n] {
            return [i,j]
        }else{
            map[m] = i
        }
    }
    
    return []
}

//15 三数之和
func threeSum_1(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    
    
    return res
}

//18 四数之和
func fourSum_1(_ nums: [Int], _ target: Int) -> [[Int]] {
    var res = [[Int]]()

    
    return res
}
