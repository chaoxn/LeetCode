//
//  LevelOrder.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/11.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"


class Solution {
public:
    
    //102层序遍历
    vector<vector<int>> levelOrder(TreeNode* root) {

        vector<vector<int>> res;
        queue<TreeNode *> queue;
        
        if (root != NULL) {
            queue.push(root);
        }
        
        while (!queue.empty()) {
            
            vector<int> levelRes;
            int size = queue.size();

            for (int i = 0; i < size; i++) {
                TreeNode *temp = queue.front();
                queue.pop();
                if (temp->left) {
                    queue.push(temp->left);
                }
                if (temp->right) {
                    queue.push(temp->right);
                }
                
                levelRes.push_back(temp->val);
            }
            res.push_back(levelRes);
        }
        return res;
    }
    
    //107. 二叉树的层序遍历 II
    vector<vector<int>> levelOrderBottom(TreeNode* root) {
        
        queue<TreeNode *> que;
        vector<vector<int>> res;
        
        if (root != NULL) {
            que.push(root);
        }
        
        while (!que.empty()) {
            
            vector<int> levelRes;
            int size = que.size();
            
            for (int i = 0; i < size; i++) {
                
                TreeNode *node = que.front();
                que.pop();
                levelRes.push_back(node->val);
                if (node->left) {
                    que.push(node->left);
                }
                if (node->right) {
                    que.push(node->right);
                }
            }
            res.push_back(levelRes);
        }
        reverse(res.begin(),res.end());
        return res;
    }
    
    //199. 二叉树的右视图
    vector<int> rightSideView(TreeNode* root) {
        
        vector<int> res;
        queue<TreeNode *> que;
        
        if (root != NULL) {
            que.push(root);
        }
        
        while (!que.empty()) {
            
            vector<int> level;
            int size = que.size();
            
            for (int i = 0 ; i < size; i++) {
                TreeNode *node = que.front();
                que.pop();
                
                if (node->left) {
                    que.push(node->left);
                }
                if (node->right) {
                    que.push(node->right);
                }
                level.push_back(node->val);
            }
            res.push_back(level.back());
        }
        
        return res;
    }
    
    Node* connect(Node* root) {
        queue<Node*> que;
        if (root != NULL) que.push(root);
        while (!que.empty()) {
            int size = que.size();
            vector<int> vec;
            Node* nodePre;
            Node* node;
            for (int i = 0; i < size; i++) {
                if (i == 0) {
                    nodePre = que.front(); // 取出一层的头结点
                    que.pop();
                    node = nodePre;
                } else {
                    node = que.front();
                    que.pop();
                    nodePre->next = node; // 本层前一个节点next指向本节点
                    nodePre = nodePre->next;
                }
                if (node->left) que.push(node->left);
                if (node->right) que.push(node->right);
            }
            nodePre->next = NULL; // 本层最后一个节点指向NULL
        }
        return root;
    }
};
