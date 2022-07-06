//
//  isValid.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/6.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    bool isValid(string s) {
        
        stack <char> st;
        
        for (int i = 0; i < s.size(); i++){
            if (s[i] == '(' ||  s[i] == '[' || s[i] == '{'){
                st.push(s[i]);
            }else{
                
                if (s[i] == ')' && !st.empty() && st.top() == '(') {
                    st.pop();
                }else if(s[i] == ']' && !st.empty() && st.top() == '['){
                    st.pop();
                }else if(s[i] == '}' && !st.empty() && st.top() == '{'){
                    st.pop();
                }else{
                    return false;
                }
            }
        }
        
        return st.empty();
    }
};
