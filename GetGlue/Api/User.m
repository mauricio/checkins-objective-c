//
//  User.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize recordId = _recordId, email = _email, name = _name;

- (void) dealloc {
  [_email release];
  [_name release];
  [super dealloc];
}

+ (User *) fromJSON:(id)JSON {
  
  User * user = [[[ User alloc ] init] autorelease];
  
  user.recordId = [[JSON valueForKey: @"id"] longValue];
  user.email = [JSON valueForKey: @"email" ];
  user.name = [JSON valueForKey: @"name" ];
  
  return user;  
}

@end
