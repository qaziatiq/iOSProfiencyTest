#import "PTResponse.h"

#import "PTRow.h"

@implementation PTResponse



+ (PTResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{
  
  PTResponse *instance = [[[PTResponse alloc] init] autorelease];
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
        PTRow *populatedMember = [PTRow instanceFromDictionary:valueMember];
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

- (void)dealloc
{
  [_title release];
  [_rows release];
  [super dealloc];
  
}


@end
