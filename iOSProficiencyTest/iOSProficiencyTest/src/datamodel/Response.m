#import "Response.h"

#import "Row.h"

@implementation Response

@synthesize rows;
@synthesize title;

+ (Response *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    Response *instance = [[Response alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"rows"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                Row *populatedMember = [Row instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.rows = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.rows) {
        [dictionary setObject:self.rows forKey:@"rows"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    return dictionary;

}


@end
