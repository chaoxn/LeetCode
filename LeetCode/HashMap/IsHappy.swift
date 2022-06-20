//
//  IsHappy.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//202. 快乐数
/**
 输入：n = 19
 输出：true
 解释：
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1

 */
func isHappy(_ n: Int) -> Bool {
    
    //求和
    func getSum(_ number: Int) -> Int {
        var sum = 0
        var num = number
        while num > 0 {
            let temp = num % 10
            sum += (temp * temp)
            num /= 10
        }
        return sum
    }
    
    var set = Set<Int>()
    var num = n
    while true {
        let sum = getSum(num)
        if sum == 1 {
            return true
        }
        //sum再次出现 -> 陷入循环
        if set.contains(sum) {
            return false
        } else {
            set.insert(sum)
        }
        num = sum
    }
}
