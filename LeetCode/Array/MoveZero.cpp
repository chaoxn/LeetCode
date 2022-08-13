//
//  MoveZero.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        
        int slow = 0;
        int fast = 0;
        
        //先移除0
        while (fast < nums.size()) {
            if (nums[fast] != 0) {
                nums[slow] = nums[fast];
                slow++;
            }
            fast++;
        }
        
        for (int i = slow; i < nums.size(); i++) {
            nums[i] = 0;
        }
    }
};
