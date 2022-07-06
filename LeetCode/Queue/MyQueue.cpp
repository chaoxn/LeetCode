//
//  MyQueue.cpp
//  LeetCode
//
//  Created by Admin on 2022/7/6.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class MyQueue {
public:
    
    stack <int> stIn;
    stack <int> stOut;
    
    MyQueue(){
        
    }
    
    void push(int x){
        stIn.push(x);
    }
    
    int pop(){
        // 只有当stOut为空的时候，再从stIn里导入数据（导入stIn全部数据）
        if (stOut.empty()) {
            // 从stIn导入数据直到stIn为空
            while (!stIn.empty()) {
                stOut.push(stIn.top());
                stIn.pop();
            }
        }
        int res = stOut.top();
        stOut.pop();
        return res;
    }
    
    int peek(){
        int res = this -> pop();
        stOut.push(res);
        return res;
    }
    
    bool empty(){
        return stIn.empty() && stOut.empty();
    }
};
