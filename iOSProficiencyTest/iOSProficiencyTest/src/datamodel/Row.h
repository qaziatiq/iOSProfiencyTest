#import <Foundation/Foundation.h>

@interface Row : NSObject {

    NSString *descriptionText;
    NSString *imageLink;
    NSString *itemTitle;

}

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *imageLink;
@property (nonatomic, copy) NSString *itemTitle;

+ (Row *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
