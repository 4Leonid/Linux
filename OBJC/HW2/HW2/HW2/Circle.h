//
//  Circle.h
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Circle : Figure

@property (nonatomic) double radius;

- (instancetype)initWithRadius:(double)radius;

@end

NS_ASSUME_NONNULL_END
