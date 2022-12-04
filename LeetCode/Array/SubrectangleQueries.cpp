//
//  SubrectangleQueries.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/3.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class SubrectangleQueries {
public:
    vector<vector<int>> vec;
    SubrectangleQueries(vector<vector<int>>& rectangle) {
        vec = rectangle;
    }
    
    void updateSubrectangle(int row1, int col1, int row2, int col2, int newValue) {
        int m = vec.size();
        int n = vec[0].size();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (i >= row1 && i <= row2 && j >= col1 && j <= col2) {
                    vec[i][j] = newValue;
                }
            }
        }
    }
    
    int getValue(int row, int col) {
        
        return vec[row][col];
    }
};
