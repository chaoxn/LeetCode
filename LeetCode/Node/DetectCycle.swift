//
//  DetectCycle.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//142. 环形链表 II
/**
  第一次相交 fast比slow多走了 2n
  第二次相交
  */
func detectCycle_1(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast === slow {
            break
        }
    }
    
    if fast == nil || fast?.next == nil {
        return nil
    }
    
    fast = head
    
    while fast !== slow {
        fast = fast?.next
        slow = slow?.next
    }
    
    return fast
}
