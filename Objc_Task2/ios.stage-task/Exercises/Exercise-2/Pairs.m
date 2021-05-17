#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    // решение через Predicate (ложное)
    // SELF приводится к спецификатору %d?
//    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF != %@", number];
//    NSArray *filteredArr = [array filteredArrayUsingPredicate:numPredicate];
//    return filteredArr.count;
// @[@1, @2, @3, @4] number: @2
    
    NSInteger count = 0;
    for (int j = 0; j<array.count; j++) {
        for (int i = j+1; i<array.count; i++) {
            if(abs([array[j] intValue] - [array[i] intValue]) == [number intValue]) {
                count++;
            }
        }
    }
    return count;
}

@end
