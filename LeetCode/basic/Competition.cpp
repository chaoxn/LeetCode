//
//  Competition.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/11.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Competition.hpp"

void split(const std::string& s, std::vector<std::string>& tokens, char delim = ' ') {
    tokens.clear();
    auto string_find_first_not = [s, delim](size_t pos = 0) -> size_t {
        for (size_t i = pos; i < s.size(); i++) {
            if (s[i] != delim) return i;
        }
        return std::string::npos;
    };
    size_t lastPos = string_find_first_not(0);
    size_t pos = s.find(delim, lastPos);
    while (lastPos != std::string::npos) {
        tokens.emplace_back(s.substr(lastPos, pos - lastPos));
        lastPos = string_find_first_not(pos);
        pos = s.find(delim, lastPos);
    }
}

bool Competition::isCircularSentence(string sentence) {
        
    vector<string> vec;
    split(sentence, vec);
    char pre;
    char la;
    char first = vec[0][0];
    string lastStr = vec[vec.size()-1];
    char last = lastStr[lastStr.length()-1];
    
    if (first != last) {
        return false;
    }
    
    for (int i = 0; i < vec.size(); i++) {
        string str = vec[i];
        
        if (i > 0) {
            la = vec[i-1][vec[i-1].length()];
            pre = str[0];
            if (pre != la) {
                return false;
            }
        }
    }
    
    return true;
}
    
long long Competition::dividePlayers(vector<int>& skill) {
    
    long long res = 0;
    
    sort(skill.begin(), skill.end());
    
    vector<vector<int>> vec;
    
    int i = 0;
    int j = skill.size() - 1;
    int temp = skill[i] + skill[j];
    
    while (i <= j) {
        
        if (skill[i] + skill[j] != temp) {
            return -1;
        }
        
        vec.push_back({skill[i], skill[j]});
        i++;
        j--;
    }
    
    for (auto v : vec){
        res += v[0] * v[1];
    }
    
    return res;
}
    
bool isDiagtl(string str){
    
    for (auto c : str){
        if (!isdigit(c)) {
            return false;
        }
    }
    
    return true;
}
    
int maximumValue(vector<string>& strs) {
    
    int res = 0;
    
    for (string str : strs){
        
        int tempLength = 0;
        
        if (isDiagtl(str)) {
            tempLength = atoi(str.c_str());
        }else{
            tempLength = str.length();
        }
        
        res = max(res, tempLength);
    }
    

    return res;
}
  


int deleteGreatestValue(vector<vector<int>>& grid) {
    int res = 0;
        
    vector<vector<int>> newGrid = grid;
    for (auto &vec : grid){
        sort(vec.begin(), vec.end(), greater<int>());
    }
    
    
    for (int i = 0; i < grid[0].size(); i++) {
        int levelMax = 0;
        
        for (int j = 0; j < grid.size(); j++) {
            cout << grid[j][i] << endl;
            levelMax = max(levelMax, grid[j][i]);
        }
        res += levelMax;
        
    }
    
    return res;
}
    
int longestSquareStreak(vector<int>& nums) {
    int res = 0;
   
   sort(nums.begin(), nums.end());
   
   int last = nums[nums.size()-1];
   
   for (int i = 0; i < nums.size(); i++) {
       
       int levelRes = 1;
       int val = nums[i];

       while (val < last) {
           val = val * val;
           
           if (!binary_search(nums.begin(), nums.end(), val)){
               break;;
           }
           
           levelRes++;
       }
       res = max(res, levelRes);
   }
       
   if (res == 1) {
       return  -1;
   }
   
   return res;
}
