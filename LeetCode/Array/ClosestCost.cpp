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
    int res;

    void dfs(int idx, int cur_sum, vector<int>& toppingCosts, int target)
    {
        // 终止条件
        // 当需要配料数等于配料数组个数
        if (idx == toppingCosts.size())
        {
            // 如果之前还没有方案 结果为当前方案
            if (res == -1
                // 如果当前总数和目标值的差距小于 之前结果和目标值的差距，结果为当前方案
                || abs(cur_sum - target) < abs(res - target)
                // 如果当前总数和目标值的差距等于之前结果和目标值的差距，结果为当前方案 选择花费小的
                || (abs(cur_sum - target) == abs(res - target) && cur_sum < res)) {
                res = cur_sum;
            }
            return ;
        }
        // 需要的配料种类依次往上加，每加一个种类，都需要对三种情况进行深度搜索。
        dfs(idx + 1, cur_sum, toppingCosts, target); //当前种类，一个都不加
        dfs(idx + 1, cur_sum + toppingCosts[idx], toppingCosts, target); //当前种类，加一个
        dfs(idx + 1, cur_sum + toppingCosts[idx] * 2, toppingCosts, target); //当前种类，加两个
    }

    int closestCost(vector<int>& baseCosts, vector<int>& toppingCosts, int target)
    {
        res = 0x3f3f3f3f;
        for (int b: baseCosts)              //暴力DFS
            //参数一： 需要的配料种类，从0开始， 意思是不需要全部配料
            //参数二：当前的花费， 不需要配料就只有基础配料价格
            //参数三：配料数组
            //参数四：目标
            dfs(0, b, toppingCosts, target);
        return res;
    }
};
