//
//  IsAnagram.swift
//  LeetCode
//
//  Created by chaox on 2022/6/16.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//242有效的字母异位词
//输入: s = "anagram", t = "nagaram"
//输出: true

func isAnagram_1(_ s: String, _ t: String) -> Bool {
    
    var hashMap = [Character: Int]()
    
    for value in Array(s){
        if let record = hashMap[value]{
            hashMap[value] = record + 1
        }else{
            hashMap[value] = 1
        }
    }
    
    for value in Array(t){
        if hashMap.keys.contains(value), hashMap[value]! > 0{
            hashMap[value]! -= 1
        }else{
            hashMap[value] = 1
        }
    }
    
    for value in hashMap.values {
        if value > 0 {
            return false
        }
    }

    
    return true
}
