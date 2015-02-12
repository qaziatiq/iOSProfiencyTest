#import <Foundation/Foundation.h>

@interface Response : NSObject {

    NSArray *rows;
    NSString *title;

}

@property (nonatomic, copy) NSArray *rows;
@property (nonatomic, copy) NSString *title;

+ (Response *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
