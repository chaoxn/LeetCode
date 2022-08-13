//
//  TwoSum_JO.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"
//剑指 Offer II 006. 排序数组中两个数字之和
class Solution {
public:
    vector<int> twoSum(vector<int>& numbers, int target) {
        vector<int> res;
        
        int left = 0;
        int right = numbers.size() - 1;
        
        while (left < right) {
            if (numbers[left] + numbers[right] > target) {
                right -= 1;
            }else if (numbers[left] + numbers[right] < target){
                left += 1;
            }else{
                res.push_back(left);
                res.push_back(right);
                break;
            }
        }
        
        return res;
    }
};
