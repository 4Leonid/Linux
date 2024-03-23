//
//  Rectangle.m
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Rectangle.h"

@implementation Rectangle

- (instancetype)initWithWidth:(double)width height:(double)height {
  self = [super init];
  if (self) {
    _width = width;
    _height = height;
  }
  return self;
}

- (double)calculateArea {
  return self.width * self.height;
}

- (double)calculatePerimeter {
  return 2 * (self.width + self.height);
}

- (void)printInfo {
  NSLog(@"Rectangle:");
  NSLog(@"Width: %.2f", self.width);
  NSLog(@"Height: %.2f", self.height);
  NSLog(@"Area: %.2f", [self calculateArea]);
  NSLog(@"Perimeter: %.2f", [self calculatePerimeter]);
}

@end
