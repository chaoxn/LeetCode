//
//  Traversal.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/11.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//二叉树递归遍历
class Solution {
public:
    
    void traversal (TreeNode* curr, vector<int> &res){
        if (curr == NULL) {
            return;
        }
        res.push_back(curr->val);
        traversal(curr->left, res);
        traversal(curr->right, res);
    }
    
    vector<int> preorderTraversal(TreeNode* root) {
        
        vector<int> res;
        traversal(root, res);
        return res;
    }
};
