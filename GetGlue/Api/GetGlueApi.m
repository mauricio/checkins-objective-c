//
//  GetGlueApi.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "GetGlueApi.h"
#import "User.h"
#import "Resource.h"

@interface GetGlueApi ()

@property (nonatomic, strong) AFHTTPClient * client;

@end

@implementation GetGlueApi

@synthesize client = _client;

- (id) init {
  self = [super init];
  if ( self )  {
    NSURL * baseURL = [NSURL URLWithString: @"http://192.168.1.10:3000" ];
    self.client = [ AFHTTPClient clientWithBaseURL: baseURL ];
    
    [self.client setDefaultHeader: @"Accept"  value: @"application/json" ];
    [self.client registerHTTPOperationClass:[AFJSONRequestOperation class]];     
  }
  return self;
}

static GetGlueApi * instance = nil;

- (void) setEmail:(NSString *)email 
      andPassword:(NSString *)password {
  [self.client setAuthorizationHeaderWithUsername: email  
                                         password: password];
}

+ (GetGlueApi *) defaultInstance {
  
  @synchronized( [GetGlueApi class] ) {
    if ( !instance ) {
      instance = [[GetGlueApi alloc] init];
    }
  }
  
  return instance;
}

- (void) performLoginWithUsername: (NSString *) username 
                      andPassword: (NSString *) password 
                        onSuccess: (void (^)(User *)) success 
                        orFailure: (void (^)(NSError *)) failure {
 
  [self.client clearAuthorizationHeader];
  [self.client setAuthorizationHeaderWithUsername: username  
                                         password: password ];
  
  [self.client getPath: @"/user.json"  
            parameters: [NSDictionary dictionary]  
               success: ^( AFHTTPRequestOperation * operation, id JSON ) {
                 
                 NSLog( @"Success response is \n%@", operation.responseString);
                 
                 if ( success ) {                  
                   success( [User fromJSON: JSON ] );
                 }
                 
               }
               failure: ^( AFHTTPRequestOperation * operation, NSError * error ) {                 

                 NSLog( @"Failure response is \n%@", operation.responseString);                 
                 
                 if ( failure ) {
                   failure(error);                   
                 }
                 
               } ];  
}

- (void) createUserWith:(NSString *)username 
            andPassword:(NSString *)password 
              onSuccess:(void (^)(User *))success 
              orFailure:(void (^)(NSError *))failure {
  
  NSMutableDictionary * parameters = [ NSMutableDictionary dictionaryWithCapacity: 2 ];
  [parameters setValue: username  forKey: @"user[email]"];
  [parameters setValue: password  forKey: @"user[password]" ];
  
  [self.client postPath: @"/user.json"  
             parameters: parameters 
                success: ^( AFHTTPRequestOperation * operation, id JSON ){
                
                  NSLog( @"Success response is \n%@", operation.responseString);
                  
                  if ( success ) {                  
                    success( [User fromJSON: JSON ] );
                  }                  
                  
                }
                failure: ^( AFHTTPRequestOperation * operation, NSError * error ) {
                  
                  NSLog( @"Failure response is %@", operation.responseString );
                  
                  if ( failure ) {
                    failure(error);
                  }
                  
                } ];
  
}

- (void) searchResourcesBy:(NSString *)query 
                 onSuccess:(void (^)(NSArray *))success 
                 orFailure:(void (^)(NSError *))failure {
  
  NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
  [parameters setValue: query  forKey: @"q"];
    
  [self.client getPath: @"/resources"  
            parameters: parameters 
               success: ^( AFHTTPRequestOperation * operation, id JSON ) {
                 
                 if (success) {                 
                   NSArray * resourcesJson = JSON;
                   NSMutableArray * resources = [NSMutableArray arrayWithCapacity: resourcesJson.count ];
                 
                   for ( id resourceJson in resourcesJson ) {
                     [resources addObject: [Resource fromJSON: resourceJson ] ];
                   }
                 
                   success( resources );
                 }
                 
               }
               failure: ^(AFHTTPRequestOperation * operation, NSError * error) {
                 
                 if ( failure ) {
                   failure(error);
                 }
                 
               }];
  
}

- (void) dealloc {
  [_client release];
  [super dealloc];
}

@end
