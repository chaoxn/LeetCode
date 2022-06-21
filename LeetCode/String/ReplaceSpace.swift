//
//  ReplaceSpace.swift
//  LeetCode
//
//  Created by Admin on 2022/6/21.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//剑指 Offer 05. 替换空格
func replaceSpace_1(_ s: String) -> String {
    
    var strArr = Array(s)
    var count = 0
    
    //统计空格个数
    for s in strArr {
        if s == " "{
            count += 1
        }
    }
    // left 指向旧数组的最后一个元素
    var left = strArr.count - 1
    // right 指向扩容后数组的最后一个元素（这里还没对数组进行实际上的扩容）
    var right = strArr.count + count * 2 - 1
    
    //填充
    for _ in 0..<count*2 {
        strArr.append(" ")
    }
    
    //从后往前判断判断
    while left < right {
        if strArr[left] == " "{
            strArr[right] = "0"
            strArr[right - 1] = "2"
            strArr[right - 2] = "%"
            left -= 1
            right -= 3
        }else{
            strArr[right] = strArr[left]
            left -= 1
            right -= 1
        }
    }

    return String(strArr)
}


func defangIPaddr(_ address: String) -> String {
    return address.replacingOccurrences(of: ".", with: "[.]")
}
