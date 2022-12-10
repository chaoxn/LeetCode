//
//  MajorityElement.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/10.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    int majorityElement(vector<int>& nums) {
        
        int count = 0;
        int victory = nums[0];
        
        for (auto num : nums){
            if (count == 0) {
                victory = num;
            }
            count += (victory == num) ? 1 : -1;
        }
        
        return victory;
    }
};
