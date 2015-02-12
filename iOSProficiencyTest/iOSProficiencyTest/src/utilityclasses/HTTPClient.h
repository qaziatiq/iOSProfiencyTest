//
//  HTTPClient.h
//  iOSProficiencyTest
//
//  Created by Qazi on 13/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import "AFHTTPClient.h"
#import "Response.h"

@interface HTTPClient : AFHTTPClient

+ (HTTPClient *) sharedClient;

-(void) getListsuccess:(void (^)(NSDictionary *result))success
               failure:(void (^)(NSError *error))failure;
@end
