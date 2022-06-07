//
//  ViewController.swift
//  LeetCode
//
//  Created by chaox on 2018/11/13.
//  Copyright © 2018 ios. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = "a", t = "ab"
        
        isAnagram(s, t)
        reverseStr("abcdefg", 2)
        isPalindrome("a.")
        
        print(firstUniqChar1("loveleetcode"))
        print("hhh哈哈哈哈哈或")
        let obj = MinStack()
        print(obj.push(-2))
        print(obj.push(0))
        print(obj.push(-3))
        print(obj.min())
        print(obj.pop())
        print(obj.min())
        
        print(lengthOfLongestSubstring("aasd"))
        
        print(Solution_17().numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]))
                
        print(permute([1,2,3]))
        
        print(letterCombinations("23"))
      
        
        var node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(2)
        node.next?.next?.next = ListNode(1)
        node.next?.next?.next?.next = nil
        var array = [23,2,12,3,45]
        
        
        isPalindrome(node)
        longestPalindrome("babad")
        
        spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
        
        print(Solution().sortArray(array))

        print(threeSum([]))
        
        print("--------------------------------快速排序---------------------------------------")
        sort(&array)
        print(array)

        print("--------------------------------归并排序---------------------------------------")
        print(merge([23,2,12,3,45]))
        print("--------------------------------插入排序---------------------------------------")
        insertionSort(&array)
        print(array)
        print("--------------------------------选择排序---------------------------------------")
        var array1 = [23,2,12,3,45]
        selectSort(&array1)
        print(array1)
        print("--------------------------------栅栏函数---------------------------------------")
        
        let cache = LRUCache.init(1)
        cache.put(2, 1)
        print(cache.get(2))
        
        print("-----------------------------------------------------------------------")

        
        let queue = dispatch_queue_concurrent_t(label: "test1")
        
        for i in 0...10{
            queue.sync {
                print(i)
            }
        }
        
        queue.async(group: nil, qos: .default, flags: DispatchWorkItemFlags.barrier) {
            print("+++++++++")
        }
        
        for i in 11...20{
            queue.sync {
                print(i)
            }
        }
        
        print("--------------------------------信号量---------------------------------------")

        print(canPermutePalindrome("tactcoa"))
        
        print("--------------------------------HW START---------------------------------------")

//        HJ61()
//        HJ81()
//        HWTest1()
        HWTest2()
        HWTest3()
        HWTest4()
        HWTest5()
        HWTest6()
        HWTest7()
        HWTest8()
        HWTest9()
        HWTest10()
        HWTest11()
        HWTest12()
        HWTest13()
        HWTest14()
        HWTest15()
        HWTest16()
        HWTest17()
        HWTest18()
        HWTest19()
        HWTest20()
        
        print("--------------------------------HW END---------------------------------------")

        Solution_2().lengthOfLongestSubstring("abcabcbb")
        Solution_10().isValid("()[]{}")
        Solution_B6().combinationSum2([10,1,2,7,6,1,5], 8)
        Solution_B7().permuteUnique([1,1,2])
        Solution_27().reverseWords("  hello world  ")
        Solution_B9().partition("aab")
        Solution_B10().restoreIpAddresses("25525511135")
        Solution_d6().uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]])
        Solution_29().nextGreaterElement([1,3,5,2,4],[6,5,4,3,2,1,7])
        Hot100_4().maxArea([1,8,6,2,5,4,8,3,7])
        Hot100_6().canJump([0])
        Hot100_10().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]],"ABCB")
    }
}

