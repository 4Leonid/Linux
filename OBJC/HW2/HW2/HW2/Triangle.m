//
//  Triangle.m
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Triangle.h"

@implementation Triangle

- (instancetype)initWithSide1:(double)side1 side2:(double)side2 side3:(double)side3 {
  self = [super init];
  if (self) {
    _side1 = side1;
    _side2 = side2;
    _side3 = side3;
  }
  return self;
}

- (double)calculateArea {
  double s = (self.side1 + self.side2 + self.side3) / 2.0;
  return sqrt(s * (s - self.side1) * (s - self.side2) * (s - self.side3));
}

- (double)calculatePerimeter {
  return self.side1 + self.side2 + self.side3;
}

- (void)printInfo {
  NSLog(@"Triangle:");
  NSLog(@"Side 1: %.2f", self.side1);
  NSLog(@"Side 2: %.2f", self.side2);
  NSLog(@"Side 3: %.2f", self.side3);
  NSLog(@"Area: %.2f", [self calculateArea]);
  NSLog(@"Perimeter: %.2f", [self calculatePerimeter]);
}

@end
