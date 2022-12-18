//
//  Competition.hpp
//  LeetCode
//
//  Created by 潮汐 on 2022/12/11.
//  Copyright © 2022 ios. All rights reserved.
//

#ifndef Competition_hpp
#define Competition_hpp

#include <stdio.h>
#include <iostream>
#include "Header.h"

class Competition {
public:
    bool isCircularSentence(string sentence);
    long long dividePlayers(vector<int>& skill);
    int smallestValue(int n);
};

#endif /* Competition_hpp */
