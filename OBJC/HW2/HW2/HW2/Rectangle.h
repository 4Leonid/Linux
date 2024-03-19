//
//  Rectangle.h
//  HW2
//
//  Created by Леонид Турко on 19.03.2024.
//

#import "Figure.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : Figure

@property (nonatomic) double height;
@property (nonatomic) double width;

- (instancetype)initWithWidth:(double)width height:(double)height;

@end

NS_ASSUME_NONNULL_END
