//
//  SwapPairs.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//24. 两两交换链表中的节点
//输入：head = [1,2,3,4]
//输出：       [2,1,4,3]
func swapPairs(_ head: ListNode?) -> ListNode? {

    let dummy: ListNode? = ListNode(0, head)
    var curr = dummy
    
    while curr?.next != nil && curr?.next?.next != nil {
        
        let temp1 = curr?.next
        let temp2 = curr?.next?.next?.next
        
        curr?.next = curr?.next?.next
        curr?.next?.next = temp1
        curr?.next?.next?.next = temp2
        
        curr = curr?.next?.next
    }
    
    return dummy?.next
}
