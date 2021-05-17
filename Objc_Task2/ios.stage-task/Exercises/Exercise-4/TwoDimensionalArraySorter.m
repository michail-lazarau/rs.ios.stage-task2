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
    
    [combineIntegers sortUsingSelector:@selector(compare:)];
    [combineStrings sortUsingSelector:@selector(compare:)];
    
    if (combineStrings.count && combineIntegers.count != 0)
    {
        return @[[combineIntegers copy],
                 [combineStrings copy]];
    }
    else if (combineIntegers.count != 0)
    {
        return [combineIntegers copy];
    }
    else if (combineStrings.count != 0)
    {
        return [combineStrings copy];
    }
    return nil;
}

// как создать компаратор отдельно?
//combineStrings sortedArrayUsingComparator:<#^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)cmptr#>
// сортировка с помощью дескриптора
// NSSortDescriptor *naturalSorting = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
// [combineStrings sortUsingDescriptors:[NSArray arrayWithObject:naturalSorting]];

@end
