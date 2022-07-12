//
//  OddCells.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/12.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"
//1252. 奇数值单元格的数目
class Solution {
public:
    int oddCells(int m, int n, vector<vector<int>>& indices) {
        

        vector<int> a(n, 0);
        vector<vector<int>> gird(m, a);

        //二维数组初始化
        vector<vector<int>> matrix(m, vector<int>(n));

        
        //维护两个一维数组 行和列
        vector<int> rows(m), cols(n);
        int res = 0;

        //记录每一行和每一列被增加的次数
        for (auto &indice: indices){
            rows[indice[0]] ++;
            cols[indice[1]] ++;
        }
        
        //遍历算好的矩阵.
        for (int i = 0; i < m; i++) {
            for (int j = 0 ; j < n; j++) {
                if((rows[i]+cols[j]) % 2)
                    res ++;
            }
        }
            
        return res;
    }
};
