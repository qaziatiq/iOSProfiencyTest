#import <Foundation/Foundation.h>

@interface PTResponse : NSObject 

@property (nonatomic, copy) NSArray *rows;
@property (nonatomic, copy) NSString *title;

+ (PTResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
