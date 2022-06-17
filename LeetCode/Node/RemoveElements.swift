//
//  Empty.swift
//  LeetCode
//
//  Created by chaox on 2022/6/16.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//203 移除链表元素
//示例 1：
//输入：head = [1,2,6,3,4,5,6], val = 6
//输出：[1,2,3,4,5]
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    let dummy = ListNode(0, head)
    var pre = dummy
    var curr = head
    
    while curr != nil {
        if curr?.val == val {
            pre.next = curr?.next
        }else{
            pre = curr!
        }
        curr = curr?.next
    }
    
    return dummy.next
}
