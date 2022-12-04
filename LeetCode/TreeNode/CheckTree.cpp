//
//  CheckTree.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/3.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    bool checkTree(TreeNode* root) {
      
        if (root->val == root->left->val + root->right->val) {
            return  true;
        }
        return false;
    }
};
