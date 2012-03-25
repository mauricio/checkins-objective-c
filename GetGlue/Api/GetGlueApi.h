//
//  GetGlueApi.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface GetGlueApi : NSObject

+ (GetGlueApi *) defaultInstance;

- (void) setEmail: (NSString *) email andPassword: (NSString *) password;

- (void) performLoginWithUsername: (NSString *) username 
                      andPassword: (NSString *) password                onSuccess: (void (^) (User * user) ) success 
                        orFailure: (void (^) (NSError * error)  ) failure ;

- (void) createUserWith: (NSString *) username 
            andPassword: (NSString *) password 
              onSuccess: (void (^) (User * user) ) success 
              orFailure: (void (^) (NSError * error)  ) failure;

- (void) searchResourcesBy: (NSString * ) query  
                 onSuccess: (void (^) (NSArray * resources) ) success 
                 orFailure: (void (^) (NSError * error)  ) failure;

@end