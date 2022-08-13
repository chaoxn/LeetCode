//
//  TwoSum.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//167. 两数之和 II - 输入有序数组
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
                res.push_back(left+1);
                res.push_back(right+1);
                break;
            }
        }
        
        return res;
    }
};
