//
//  ReverseString.swift
//  LeetCode
//
//  Created by Admin on 2022/6/16.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

/** 344. 反转字符串
 输入：s = ["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 */
func reverseString_1(_ s: inout [Character]) {
    
    var left = 0
    var right = s.count - 1
    
    while left <= right {
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        left += 1
        right -= 1
    }
}

//541 反转字符串2
func reverseStr_1(_ s: String, _ k: Int) -> String {
    var ch = Array(s)
    
    for i in stride(from: 0, to: ch.count, by: 2 * k) {
        var left = i
        //寻找前k的右边界 //s.count - 1是为了判断剩下,
        var right = min(s.count - 1, left + k - 1)
        
        //交换
        while left < right {
            (ch[left], ch[right]) = (ch[right], ch[left])
            left += 1
            right -= 1
        }
    }
    return String(ch)
}

//151. 颠倒字符串中的单词
/**
 输入: "the sky is blue"
 输出: "blue is sky the"
 */
func reverseWords_1(_ s: String) -> String {
    
    //去掉首尾空格
    let str = trimAndExtrusionWhitespaces(s)
    var res = ""
    //倒序遍历
    var j = str.count - 1
    var i = j
    
    while i >= 0 {
        //第一次遇到空格时 添加[i+1...j]
        if Array(str)[i] == " "{
            res = res + Array(str)[i+1...j] + " "
            //将到下一个单词中间的空格跳过，并记录下一个单词尾部j
            while Array(str)[i] == " "{
                i -= 1
            }
            j = i
        }
        i -= 1
    }
    res = res + Array(str)[0...j]
    return res
}

func trimAndExtrusionWhitespaces(_ s: String) -> String {
    return s.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).filter { $0 != "" }.joined(separator: " ")
}


//剑指 Offer 58 - II. 左旋转字符串
func reverseLeftWords(_ s: String, _ n: Int) -> String {
    
    let bStr = Array(s)[0...n-1]
    let aStr = Array(s)[n...s.count-1]
    return String(aStr) + String(bStr)
    
    let index = s.index(s.startIndex, offsetBy: n)
    return s[index...].appending(s.prefix(n))
}
