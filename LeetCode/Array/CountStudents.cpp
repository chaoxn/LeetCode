//
//  CountStudents.cpp
//  LeetCode
//
//  Created by 潮汐 on 2022/10/19.
//  Copyright © 2022 ios. All rights reserved.
//

#include "Header.h"

class Solution {
public:
    int countStudents(vector<int>& students, vector<int>& sandwiches) {
        vector<int> student = students;
        vector<int> sandwiche = sandwiches;
        int res = 0;

        for(auto it = student.begin(); it != student.end(); ) {
             
            bool isContain = find(student.begin(), student.end(), sandwiche[0]) != student.end();
            
            if (isContain){
                student.erase(student.begin(),student.begin()+1);
                sandwiche.erase(sandwiche.begin(),sandwiche.begin()+1);
            } else {
                
                int temp = student[0];
                student.erase(student.begin(),student.begin()+1);
                student.push_back(temp);
                ++it;
            }
        }
        res = sandwiche.size();
        return res;
    }
    
    
    bool is_element_in_vector(vector<int> v,int element)
    {
        vector<int>::iterator it;
        it=find(v.begin(),v.end(),element);
        if (it!=v.end())
        {
            return true;
        }
        else{
            return false;
        }
   }
};
