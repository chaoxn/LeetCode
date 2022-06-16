//
//  Search.swift
//  LeetCode
//
//  Created by chaox on 2022/6/15.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//二分查找专题

class Search: NSObject {
    //704
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            
            let mid = (right + left) / 2
            
            if nums[mid] < target {
                left = mid + 1
            }else if nums[mid] > target {
                right = mid - 1
            }else{
                return mid
            }
        }
        return -1
     }
    
    //35. 搜索插入位置
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            
            let mid = (right + left) / 2
            
            if nums[mid] < target {
                left = mid + 1
            }else if nums[mid] > target {
                right = mid - 1
            }else{
                return mid
            }
        }
        return right+1
    }
    
    //34. 在排序数组中查找元素的第一个和最后一个位置
    /**
     输入：nums = [5,7,7,8,8,10], target = 8
     输出：[3,4]
     */
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var res = [Int]()
        
        while left <= right {
            
            let mid = (right + left) / 2
            
            if nums[mid] < target {
                left = mid + 1
            }else if nums[mid] > target {
                right = mid - 1
            }else{
                
             
                
                
            }
        }
        
        
        
        return res
    }
}
