//
//  SecondHighest.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/3.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    int secondHighest(string s) {
        int first = -1, second = -1;
        for (auto c : s) {
            if (isdigit(c)) {
                int num = c - '0';
                if (num > first) {
                    second = first;
                    first = num;
                } else if (num < first && num > second) {
                    second = num;
                }
            }
        }
        return second;
    }
};
