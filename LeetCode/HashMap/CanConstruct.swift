//
//  CanConstruct.swift
//  LeetCode
//
//  Created by Admin on 2022/6/21.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

/**
 383. 赎金信
 输入：ransomNote = "aa", magazine = "aab"
 输出：true
 输入：ransomNote = "aa", magazine = "ab"
 输出：false
 */
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    
    var map = [Character:Int]()
    
    for char in Array(ransomNote){
        if let record = map[char]{
            map[char] = record + 1
        }else{
            map[char] = 1
        }
    }
    
    for char in magazine {
        if map.keys.contains(char){
            if map[char]! > 0 {
                map[char]! -= 1
            }
        }
    }
    
    for value in map.values {
        if value > 0 {
            return false
        }
    }
    
    
    return true
}
