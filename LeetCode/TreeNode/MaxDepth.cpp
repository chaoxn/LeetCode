//
//  MaxDepth.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/22.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
    
public:
    int maxDepth(TreeNode* root) {
        
        if (root == nullptr) {
            return 0;
        }
        
        int left = maxDepth(root->left);
        int right = maxDepth(root->right);
        
        int res = 1 + max(left, right);
        
        return res;
    }
};
