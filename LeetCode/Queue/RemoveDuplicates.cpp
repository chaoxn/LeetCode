//
//  RemoveDuplicates.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/6.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"
//1047删除字符串中的重复项
class Solution {
public:
    string removeDuplicates(string s) {
        
        stack <char> st;
        
        for (char c: s){
            if (st.empty() || c != st.top()){
                st.push(c);
            }else{
                st.pop();
            }
        }
        
        string res = "";
        
        while (!st.empty()) {
            res += st.top();
            st.pop();
        }
        reverse(res.begin(), res.end());
        return res;
    }
};
