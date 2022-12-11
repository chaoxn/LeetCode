//
//  MinOperations.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/11.
//  Copyright © 2022 ios. All rights reserved.
//

#include <stdio.h>
#include "Header.h"

class Solution {
public:
    int minOperations(vector<int>& nums) {
              
        int count = 0;
               int n = nums.size();

               for (int i = 1; i < n ; i++){
                   if (nums[i] <= nums[i-1]){
                       count += nums[i-1] - nums[i] + 1;
                       nums[i] = nums[i-1] + 1;
                   }
               }
              
               return count;
        
        return count;
        
//        int las = 0, ans = 0;
//             for(int x: nums) {
//                 int cur = max(x, las + 1);
//                 ans += cur - x;
//                 las = cur;
//             }
//        return ans;
    }
};
