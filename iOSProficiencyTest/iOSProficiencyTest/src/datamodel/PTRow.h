#import <Foundation/Foundation.h>

@interface PTRow : NSObject 

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *imageLink;
@property (nonatomic, copy) NSString *itemTitle;

+ (PTRow *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
