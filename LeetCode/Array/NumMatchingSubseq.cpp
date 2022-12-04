//
//  NumMatchingSubseq.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/11/17.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    
    int numMatchingSubseq(string s, vector<string>& words) {
        
        int cnt = 0;
        for (string &word : words) {
            int cur = -1;
            bool ok = true;
            for (char &c : word) {
                // 查找 cur 之后是否出现了 c
                cur = s.find(c, cur + 1);
                if (cur == string::npos) {
                    ok = false;
                    break;
                }
            }
            if (ok) cnt++;
        }
        return cnt;
    }
};
