//
//  Header.h
//  LeetCode
//
//  Created by Admin on 2022/7/6.
//  Copyright © 2022 ios. All rights reserved.
//

#ifndef Header_h
#define Header_h

#include <stdio.h>
#include <iostream>
#include <stack>
#include <vector>
#include <queue>
#include <array>
#include <unordered_map>
#include <map>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* next;

    Node() : val(0), left(NULL), right(NULL), next(NULL) {}

    Node(int _val) : val(_val), left(NULL), right(NULL), next(NULL) {}

    Node(int _val, Node* _left, Node* _right, Node* _next)
        : val(_val), left(_left), right(_right), next(_next) {}
};

using namespace std;

#endif /* Header_h */
