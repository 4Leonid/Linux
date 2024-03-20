//
//  Doctor.m
//  HW3
//
//  Created by Леонид Турко on 20.03.2024.
//

#import "Doctor.h"

@implementation Doctor

- (void) givePill {
  NSLog(@"The doctor gave the patient a pill");
  [self.delegate takePill];
}

@end
