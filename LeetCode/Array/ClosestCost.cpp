//
//  ClosestCost.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/4.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    int closestCost(vector<int>& b, vector<int>& t, int target) {
        this->target = target;
        for (int i = 0; i < b.size(); i++) {
            dfs(t, 0, b[i]);
        }
        return res;
    }
    
private:
    int target;
    int res = -1;
    void dfs(vector<int> &t, int i, int sum) {
        if (i == t.size()) {
            if (res == -1 || abs(sum - target) < abs(res - target) || (abs(sum - target) == abs(res - target) && sum < res)) {
                res = sum;
            }
            return;
        }
        
        dfs(t, i + 1, sum); // 不选
        dfs(t, i + 1, sum + t[i]); // 选一个
        dfs(t, i + 1, sum + t[i] * 2); // 选两个
    }
};
