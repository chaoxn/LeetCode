//
//  Intersection.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//349. 两个数组的交集
//输入：nums1 = [1,2,2,1], nums2 = [2,2]
//输出：[2]
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var set1 = Set<Int>()
    var set2 = Set<Int>()
    for num in nums1 {
        set1.insert(num)
    }
    for num in nums2 {
        //1和2重复的元素加到set2  控件换时间
        if set1.contains(num) {
            set2.insert(num)
        }
    }
    
    return Array(set2)
}
