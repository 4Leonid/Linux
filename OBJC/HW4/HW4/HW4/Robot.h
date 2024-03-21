//
//  Robot.h
//  HW4
//
//  Created by Леонид Турко on 20.03.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;

- (void)run:(NSString *(^)(void))block;
@end

NS_ASSUME_NONNULL_END
