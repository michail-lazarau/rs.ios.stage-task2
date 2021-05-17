#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:@""];
    NSMutableString *reversedStr = [str mutableCopy];
    NSUInteger x = n;

    while(x > 0) {
        x % 2 == 0 ? [str appendString:@"0"] : [str appendString:@"1"];
        x /= 2;
    }
    
    // reverse straight order of chars
    for (NSUInteger i = 0; i<str.length; i++) {
        NSString *character = [NSString stringWithFormat:@"%C", [str characterAtIndex:i]];
        [reversedStr appendString:character];
    }
    
    // add missing zeroes
    for (NSUInteger i = 0; i < 8 - str.length; i++) {
        [reversedStr appendString:@"0"];
    }
    
    // convert radix = 2 to radix = 10;
    const char* utf8String = [reversedStr UTF8String];
    char* end = NULL;
    return strtol(utf8String, &end, 2);
}
