//
//  main.m
//  HW4
//
//  Created by Леонид Турко on 20.03.2024.
//

#import <Foundation/Foundation.h>
#import "Robot.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Robot *robot = [[Robot alloc] init];

    [robot run:^NSString *{ return @"up"; }];

    [robot run:^NSString *{ return @"right"; }];

    [robot run:^NSString *{ return @"down"; }];

    [robot run:^NSString *{ return @"left"; }];
  }
  return 0;
}
