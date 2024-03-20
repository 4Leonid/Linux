//
//  main.m
//  HW3
//
//  Created by Леонид Турко on 20.03.2024.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"


// MARK: - MAIN
int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Doctor *doctor = [Doctor new];
    Patient *patient = [Patient new];

    doctor.delegate = patient;
    [doctor givePill];
  }
  return 0;
}
