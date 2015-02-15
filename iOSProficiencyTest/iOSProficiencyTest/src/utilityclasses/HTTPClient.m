//
//  HTTPClient.m
//  iOSProficiencyTest
//
//  Created by Qazi on 13/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import "HTTPClient.h"

NSString *const kMainURL = @"https://dl.dropboxusercontent.com/u/746330/";
NSString* const kFFactsURL = @"https://dl.dropboxusercontent.com/u/746330/facts.json";

@implementation HTTPClient

+ (HTTPClient *)sharedClient
{
  static HTTPClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[[self alloc] initWithBaseURL:[NSURL URLWithString:kMainURL]] autorelease];
  });
  
  return _sharedClient;
}


-(void) getListsuccess:(void (^)(NSDictionary *result))success
               failure:(void (^)(NSError *error))failure

{
  
  
  [self getPath:kFFactsURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
   {
     
     
     NSString *response =[[[NSString alloc] initWithData:responseObject encoding:NSASCIIStringEncoding]autorelease];
     
     NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding] ;
     __block NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
     
     success(responseDict);
     
   } failure:^(AFHTTPRequestOperation *operation, NSError *error)
   {
     
     failure(error);
     
   }];
  
}


@end
