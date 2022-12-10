//
//  BridgeFile.m
//  LeetCode
//
//  Created by Admin on 2022/7/12.
//  Copyright © 2022 ios. All rights reserved.
//

#import "BridgeFile.h"
#import "STL.hpp"
#import <memory>
#include "Header.h"
@implementation BridgeFile

-(void)testCpp{
    auto sp = std::make_shared<STL>();
    //sp->Vector();
    sp->Array();
    vector<int> vc1 = {1,1,0,0};
    vector<int> vc2 = {0,1,0,1};
    int c = sp->countStudents(vc1, vc2);
    bool s = sp->isSubseq("abcde", "af");
    bool s1 = sp->isCircularSentence("leetcode exercises sound delightful");
    vector<int> vc3 = {3,4};
    sp->dividePlayers(vc3);
    
    
}

@end
