//
//  main.m
//  HW1
//
//  Created by Леонид Турко on 18.03.2024.
//

#import <Foundation/Foundation.h>
#import <math.h>
// 1. Решить квадратные уравнения:
@interface QuadraticEquationSolver : NSObject

+ (NSArray *)solveQuadraticEquationWithA:(double)a b:(double)b c:(double)c;

@end

@implementation QuadraticEquationSolver

+ (NSArray *)solveQuadraticEquationWithA:(double)a b:(double)b c:(double)c {
    double discriminant = b * b - 4 * a * c;
    if (discriminant < 0) {
        return @[]; // No real roots
    } else if (discriminant == 0) {
        double root = -b / (2 * a);
        return @[@(root)]; // One real root
    } else {
        double root1 = (-b + sqrt(discriminant)) / (2 * a);
        double root2 = (-b - sqrt(discriminant)) / (2 * a);
        return @[@(root1), @(root2)]; // Two real roots
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        double a = 1.0; // Coefficient of x^2
        double b = -3.0; // Coefficient of x
        double c = 2.0; // Constant term
        
        NSArray *roots = [QuadraticEquationSolver solveQuadraticEquationWithA:a b:b c:c];
        if (roots.count == 0) {
            NSLog(@"No real roots");
        } else if (roots.count == 1) {
            NSLog(@"One real root: %@", roots[0]);
        } else {
            NSLog(@"Two real roots: %@, %@", roots[0], roots[1]);
        }
    }
    return 0;
}
// 2. Создать программу, которая находит большее число среди 3-х чисел.
NSInteger maxOfThree(NSInteger a, NSInteger b, NSInteger c) {
    NSInteger max = a;
    if (b > max) {
        max = b;
    }
    if (c > max) {
        max = c;
    }
    return max;
}

int newMain(int argc, const char * argv[]) {
    @autoreleasepool {
        // Входные числа
        NSInteger num1 = 10;
        NSInteger num2 = 25;
        NSInteger num3 = 15;
        
        // Находим максимальное число
        NSInteger maxNumber = maxOfThree(num1, num2, num3);
        
        // Выводим результат
        NSLog(@"Наибольшее число: %ld", (long)maxNumber);
    }
    return 0;
}

