#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray.count == 0) {
        return @"";
    }
    
    for (NSString *str in numbersArray) {
        //if ([str integerValue] != [[NSString stringWithFormat:@"%c", str] integerValue])
        //if([str substringToIndex:1] isEqualToString:@"-")
        
        if ([str integerValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if ([str integerValue] != (unsigned char)[str integerValue]) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
    }
    
    if (numbersArray.count < 4) {
        NSMutableArray *mutableNumbersArr = [numbersArray mutableCopy];
        for(int i = 0; i < 4 - numbersArray.count; i++) {
            [mutableNumbersArr addObject:@0];
        }
        numbersArray = [NSArray arrayWithArray:mutableNumbersArr];
    }
    else if (numbersArray.count > 4) {
        numbersArray = [numbersArray subarrayWithRange:NSMakeRange(0, 4)];
    }
    
    return [numbersArray componentsJoinedByString:@"."];
}

@end
