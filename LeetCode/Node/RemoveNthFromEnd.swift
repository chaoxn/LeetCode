//
//  RemoveNthFromEnd.swift
//  LeetCode
//
//  Created by Admin on 2022/6/20.
//  Copyright © 2022 ios. All rights reserved.
//

import UIKit

//19. 删除链表的倒数第 N 个结点
//输入：head = [1,2,3,4,5], n = 2
//输出：       [1,2,3,5]
func removeNthFromEnd_1(_ head: ListNode?, _ n: Int) -> ListNode? {
        
    let dummy = ListNode(0, head)
    var pre = dummy
    var fast = head
    var slow = head
    
    for _ in 0..<n {
        fast = fast?.next
    }
    
    while fast != nil {
        pre = slow!
        fast = fast?.next
        slow = slow?.next
    }
    pre.next = slow?.next
    
    return dummy.next
}
