//
//  SumRange.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//303. 区域和检索 - 数组不可变
class NumArray {
    
private:
    vector<int> sums;
    
public:
    NumArray(vector<int>& nums) {
          int n = nums.size();
          sums.resize(n + 1);
          for (int i = 0; i < n; i++) {
              sums[i + 1] = sums[i] + nums[i];
          }
      }

      int sumRange(int i, int j) {
          return sums[j + 1] - sums[i];
      }
};
