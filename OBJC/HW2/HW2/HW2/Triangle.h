//
//  Triangle.h
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Triangle : Figure

@property (nonatomic, assign) double side1;
@property (nonatomic, assign) double side2;
@property (nonatomic, assign) double side3;

- (instancetype)initWithSide1:(double)side1 side2:(double)side2 side3:(double)side3;

@end

NS_ASSUME_NONNULL_END
