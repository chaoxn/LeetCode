//
//  ReverseWords.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/8/13.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

//151. 颠倒字符串中的单词
class Solution {
public:
    string reverseWords(string s) {
        //三指针
        int k = 0;
        for(int i = 0; i < s.size(); i++)
        {
            int j = i;
            while(j < s.size() && s[j] == ' ') j++; //j指针跳过单词的前导空格
            if(j == s.size()) break; //这里break是为了保证最后不会s[k++] = ' '，多加一个空格
            i = j;
            while(j < s.size() && s[j] != ' ') j++;
            reverse(s.begin() + i, s.begin() + j);
            if(k)  s[k++] = ' '; //补个空格
            while( i < j) s[k++] = s[i++];
        }
        s.erase(s.begin() + k,s.end());//擦除多余的空格
        reverse(s.begin(),s.end());
        return s;
    }
};
