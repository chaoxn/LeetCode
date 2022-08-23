//
//  InvertTree.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/23.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    void reverse(TreeNode* root){
        if (root == nullptr) {
            return;
        }
        
        /**** 前序位置 ****/
        // 每一个节点需要做的事就是交换它的左右子节点
        TreeNode *temp = root->left;
        root->left = root->right;
        root->right = temp;
        
        reverse(root->left);
        reverse(root->right);
    }
    
    TreeNode* invertTree(TreeNode* root) {
        
        //方法一
//        reverse(root);
//        return root;
        
        //方法二
        if (root == nullptr) {
            return nullptr;
        }
        
        TreeNode *left = invertTree(root->left);
        TreeNode *right = invertTree(root->right);
        
        root->left = right;
        root->right = left;
        
        return root;
    }
};
