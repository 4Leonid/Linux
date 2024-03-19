//
//  Figure.m
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Figure.h"

@implementation Figure

// MARK: - Default methods to mimic abstract methods
- (double)calculateArea {
  return 0.0;
}

- (double)calculatePerimeter {
  return 0.0;
}

- (void)printInfo {
  NSLog(@"This is an abstract figure");
}

@end
