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
              
        func left_bound() -> Int {
            
            var left = 0
            var right = nums.count - 1
            while left <= right {
                
                let mid = (right + left) / 2
                
                if nums[mid] < target {
                    left = mid + 1
                }else if nums[mid] > target {
                    right = mid - 1
                }else if nums[mid] == target{
                    // 别返回，锁定左侧边界
                    right = mid - 1
                }
            }
            // 最后要检查 left 越界的情况
            if left >= nums.count || nums[left] != target {
                return -1
            }
            
            return left
        }
        
        func right_bound() -> Int {
            var left = 0
            var right = nums.count - 1;
            while (left <= right) {
                let mid = left + (right - left) / 2;
                if (nums[mid] < target) {
                    left = mid + 1;
                } else if (nums[mid] > target) {
                    right = mid - 1;
                } else if (nums[mid] == target) {
                    // 别返回，锁定右侧边界
                    left = mid + 1;
                }
            }
            // 最后要检查 right 越界的情况
            if (right < 0 || nums[right] != target) {
                return -1;
            }
            return right;
        }
        
        return [left_bound(), right_bound()]
    }
}
