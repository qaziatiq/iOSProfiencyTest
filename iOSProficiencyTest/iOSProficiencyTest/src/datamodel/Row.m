#import "Row.h"

@implementation Row

@synthesize descriptionText = _descriptionText;
@synthesize imageLink = _imageLink;
@synthesize itemTitle = _itemTitle;

+ (Row *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    Row *instance = [[[Row alloc] init] autorelease];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"imageHref"]) {
        [self setValue:value forKey:@"imageLink"];
    } else if ([key isEqualToString:@"title"]) {
        [self setValue:value forKey:@"itemTitle"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.imageLink) {
        [dictionary setObject:self.imageLink forKey:@"imageLink"];
    }

    if (self.itemTitle) {
        [dictionary setObject:self.itemTitle forKey:@"itemTitle"];
    }

    return dictionary;

}

-(void) dealloc
{
    [_descriptionText release];
    [_imageLink release];
    [_itemTitle release];
    [super dealloc];
}


@end
