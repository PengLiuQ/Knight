//
//  block______Tests.m
//  block(基本使用)Tests
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface block______Tests : XCTestCase

@end

@implementation block______Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
