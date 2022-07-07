//
//  EvalRPN.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/7.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//150. 逆波兰表达式求值
class Solution {
public:
    int evalRPN(vector<string>& tokens) {
        
        stack <int> st;
        
        for (int i = 0 ; i < tokens.size(); i++) {
            
            if (tokens[i] == "+" || tokens[i] == "-" || tokens[i] == "*" || tokens[i] == "/") {
                
                int num1 = st.top();
                st.pop();
                int num2 = st.top();
                st.pop();
                
                if (tokens[i] == "+") st.push(num2 + num1);
                if (tokens[i] == "-") st.push(num2 - num1);
                if (tokens[i] == "*") st.push(num2 * num1);
                if (tokens[i] == "/") st.push(num2 / num1);
            }else{
                st.push(stoi(tokens[i]));
            }
        }
        
        int res = st.top();
        st.pop(); //把栈里最后一个元素弹出
        return res;
    }
};
