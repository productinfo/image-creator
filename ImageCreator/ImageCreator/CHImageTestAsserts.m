#import "CHImageTestAsserts.h"

@implementation CHImageTestAsserts

void assertEqualColorArrayByHue(NSArray *array, NSArray *expected, CGFloat accuracy) {
  NSCAssert([expected count] == [array count], @"Arrays have different lengths");

  for (NSInteger i = 0; i < [expected count]; i++) {
    UIColor *color = array[i];
    UIColor *expectedColor = expected[i];

    CGFloat h, s, b, a;
    CGFloat eH, eS, eB, eA;
    [color getHue:&h saturation:&s brightness:&b alpha:&a];
    [expectedColor getHue:&eH saturation:&eS brightness:&eB alpha:&eA];

    NSString *error =
        [NSString stringWithFormat:@"Comparing h values failed. Expected %f and was %f", h, eH];
    NSCAssert(ABS(h - eH) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing s values failed. Expected %f and was %f", s, eS];
    NSCAssert(ABS(s - eS) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing b values failed. Expected %f and was %f", b, eB];
    NSCAssert(ABS(b - eB) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing a values failed. Expected %f and was %f", a, eA];
    NSCAssert(ABS(a - eA) < accuracy, error);
  }
}

void assertEqualColorArrayByRGB(NSArray *array, NSArray *expected, CGFloat accuracy) {
  NSCAssert([expected count] == [array count], @"Arrays have different lengths");

  for (NSInteger i = 0; i < [expected count]; i++) {
    UIColor *color = array[i];
    UIColor *expectedColor = expected[i];

    CGFloat r, g, b, a;
    CGFloat eR, eG, eB, eA;
    [color getRed:&r green:&g blue:&b alpha:&a];
    [expectedColor getRed:&eR green:&eG blue:&eB alpha:&eA];

    NSString *error =
        [NSString stringWithFormat:@"Comparing r values failed. Expected %f and was %f", r, eR];
    NSCAssert(ABS(r - eR) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing g values failed. Expected %f and was %f", g, eG];
    NSCAssert(ABS(g - eG) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing b values failed. Expected %f and was %f", b, eB];
    NSCAssert(ABS(b - eB) < accuracy, error);

    error = [NSString stringWithFormat:@"Comparing a values failed. Expected %f and was %f", a, eA];
    NSCAssert(ABS(a - eA) < accuracy, error);
  }
}

void assertEqualFloatArray(NSArray *array, NSArray *expected, CGFloat accuracy) {
  NSCAssert([expected count] == [array count], @"Arrays have different lengths");

  for (NSInteger i = 0; i < [expected count]; i++) {
    CGFloat val = [array[i] floatValue];
    CGFloat eVal = [expected[i] floatValue];

    NSString *error = [NSString stringWithFormat:
        @"Comparing values failed, %f and %f are not equal to within %f", eVal, val, accuracy];
    NSCAssert(ABS(val - eVal) < accuracy, error);
  }
}

void assertEqualCFloatArraysWithAccuracy(CGFloat *array,
                                         CGFloat *expected,
                                         NSInteger length,
                                         CGFloat accuracy) {
  for (NSInteger i = 0; i < length; i++) {
    CGFloat eVal = expected[i];
    CGFloat val = array[i];
    NSString *error = [NSString stringWithFormat:
        @"Comparing values failed, %f and %f are not equal to within %f", eVal, val, accuracy];
    NSCAssert(ABS((eVal - val)) <= accuracy, error);
  }
}

@end
