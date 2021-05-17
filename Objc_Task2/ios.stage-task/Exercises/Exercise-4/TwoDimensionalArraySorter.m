#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if (![array[0] isKindOfClass:[NSArray class]])
    {
        return @[];
    }
    
    NSMutableArray *combineIntegers = [[NSMutableArray alloc] init];
    NSMutableArray *combineStrings = [[NSMutableArray alloc] init];
    
    for (NSArray *arr in array) {
        for (NSObject *obj in arr) {
            if ([obj isKindOfClass:[NSNumber class]]) {
                [combineIntegers addObject:obj];
            }
            else if ([obj isKindOfClass:[NSString class]]) {
                [combineStrings addObject:obj];
            }
        }
    }
    
    //[combineIntegers sortedArrayUsingSelector:@selector(compare:)];
    //[combineStrings sortedArrayUsingSelector:@selector(compare:) == NSOrderedDescending];
    
    if (combineStrings.count && combineIntegers.count != 0)
    {
        return @[[[combineIntegers sortedArrayUsingSelector:@selector(compare:)] copy],
                 [[combineStrings sortedArrayUsingDescriptors:
                  [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO], nil]] copy]];
    }
    else if (combineIntegers.count != 0)
    {
        return [[combineIntegers sortedArrayUsingSelector:@selector(compare:)] copy];
    }
    else if (combineStrings.count != 0)
    {
        return [[combineStrings sortedArrayUsingSelector:@selector(compare:)] copy];
    }
    return nil;
}

// как создать компаратор отдельно?
//combineStrings sortedArrayUsingComparator:
// сортировка с помощью дескриптора
// NSSortDescriptor *naturalSorting = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
// [combineStrings sortUsingDescriptors:[NSArray arrayWithObject:naturalSorting]];

@end
