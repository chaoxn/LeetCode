//
//  Rotate.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//48. 旋转图像
class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {
        //先沿斜对角线翻转
        int n = matrix.size();
        for(int i = 0; i < n; i++)
        for(int j = 0; j < i; j++)
        swap(matrix[i][j],matrix[j][i]);
        //再沿垂直竖线翻转
        for(int i = 0;i < n; i++)
        for(int j = 0, k = n - 1; j < k ; j++, k--) //类似于双指针，由两端向中心靠齐
        swap(matrix[i][j],matrix[i][k]);
    }
};

