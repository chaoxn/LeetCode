//
//  Shuffle.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/29.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//1470. 重新排列数组
class Solution {
public:
    vector<int> shuffle(vector<int>& nums, int n) {
        
        vector<int> res;
        for(int i=0;i<n;i++){
            res.push_back(nums[i]);
            res.push_back(nums[n+i]);
        }
        
        return res;
    }
};
