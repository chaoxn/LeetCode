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

//15 三数之和 | 双指针 去重
/**
 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 满足要求的三元组集合为： [ [-1, 0, 1], [-1, -1, 2] ]
 */
func threeSum_1(_ nums: [Int]) -> [[Int]] {
    
    var res = [[Int]]()
    let nums = nums.sorted()
    
    if nums.count < 2 {
        return []
    }
    
    for k in 0..<nums.count-2 {
        
        if nums[k] > 0 {
            break
        }
    
        if k > 0 && nums[k-1] == nums[k]{
            continue
        }
        
        var i = k+1
        var j = nums.count - 1
        
        while i < j {
            
            let sum = nums[i] + nums[j] + nums[k]
            let left = nums[i]
            let right = nums[j]
            
            //左指针前进
            if sum < 0 {
                while i < j && nums[i] == left{
                    i += 1
                }
            }else if sum > 0 {
                //右指针后退
                while i < j && nums[j] == right{
                    j -= 1
                }
            }else{
                res.append([nums[i], nums[j], nums[k]])
                while i < j && nums[i] == left{
                    i += 1
                }
                while i < j && nums[j] == right{
                    j -= 1
                }
            }
        }
    }
    
    return res
}

//18 四数之和
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var res = [[Int]]()
       var sorted = nums
       sorted.sort()
       for k in 0 ..< sorted.count {
           // 这种剪枝不行,target可能是负数
   //            if sorted[k] > target {
   //                return res
   //            }
           // 去重
           if k > 0 && sorted[k] == sorted[k - 1] {
               continue
           }
           
           let target2 = target - sorted[k]
           for i in (k + 1) ..< sorted.count {
               if i > (k + 1) && sorted[i] == sorted[i - 1] {
                   continue
               }
               var left = i + 1
               var right = sorted.count - 1
               while left < right {
                   let sum = sorted[i] + sorted[left] + sorted[right]
                   if sum < target2 {
                       left += 1
                   } else if sum > target2 {
                       right -= 1
                   } else {
                       res.append([sorted[k], sorted[i], sorted[left], sorted[right]])
                       while left < right && sorted[left] == sorted[left + 1] {
                           left += 1
                       }
                       while left < right && sorted[right] == sorted[right - 1]  {
                           right -= 1
                       }
                       // 找到答案 双指针同时收缩
                       left += 1
                       right -= 1
                   }
               }
           }
       }
       return res
}


//454. 四数相加 II
func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
    
    var count = 0
    var ab_map = [Int:Int]()
    for i in 0..<nums1.count {
      for j in 0..<nums2.count {
        let key = nums1[i]+nums2[j]
          ab_map[key, default:0] += 1
      }
    }
  
    for k in 0..<nums3.count {
      for l in 0..<nums4.count {
        let key = nums3[k]+nums4[l]
        if let value = ab_map[-key] {
          count += value
        }
      }
    }
    return count
}
