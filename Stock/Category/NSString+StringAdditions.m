//
//  NSString+StringAdditions.m
//  Stock
//
//  Created by apple on 15/10/13.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "NSString+StringAdditions.h"

@implementation NSString (StringAdditions)

+ (NSString *)localizedString:(NSString *)string {
    
//    static NSString *randomNonExistingString = @";0|,9H6+z?B&r;ko";
//    
//    NSString *text = NSLocalizedStringWithDefaultValue(string, nil, [NSBundle mainBundle], randomNonExistingString, nil);
//    if (text == randomNonExistingString) {
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"];
//        NSBundle *languageBundle = [NSBundle bundleWithPath:path];
//        return NSLocalizedStringFromTableInBundle(string, nil, languageBundle, nil);
//    } else {
//        return text;
//    }
    
    return string;
}

@end
