//
//  RemoveDuplicates.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
        
    int removeDuplicates(vector<int>& nums) {
        int slow = 0;
        int fast = 0;
        
        while (fast < nums.size()) {
            if (nums[fast] != nums[slow]) {
                slow += 1;
                nums[slow] = nums[fast];
            }
            fast += 1;
        }
        
        return slow+1;
    }
};
