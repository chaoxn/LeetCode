//
//  RemoveElement.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//27. 移除元素
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        
        
        int fast = 0;
        int slow = 0;
        
        while (fast < nums.size()) {
            if (nums[fast] != val) {
                nums[slow] = nums[fast];
                slow++;
            }
            fast++;
        }
        
        return slow;
    }
};
