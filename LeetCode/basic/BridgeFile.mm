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
#include "Competition.hpp"
@implementation BridgeFile

-(void)testCpp{
    auto sp = std::make_shared<STL>();
    //sp->Vector();
    sp->Array();
    vector<int> vc1 = {1,1,0,0};
    vector<int> vc2 = {0,1,0,1};
    int c = sp->countStudents(vc1, vc2);
    bool s = sp->isSubseq("abcde", "af");
    
    auto s1 = std::make_shared<Competition>();

    s1 -> smallestValue(12);
}

@end
