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

@implementation BridgeFile

-(void)testCpp{
    auto sp = std::make_shared<STL>();
    sp->Vector();
    sp->Array();
}

@end
