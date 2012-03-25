//
//  Resource.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "Resource.h"

@implementation Resource

@synthesize  recordId = _recordId, name = _name, description = _description;

- (void) dealloc {
  [_name release];
  [_description release];
  [super dealloc];
}

+ (Resource *) fromJSON:(id)JSON {
  
  Resource * resource = [[[Resource alloc] init] autorelease];
  
  resource.recordId = [[JSON valueForKey: @"id" ] longValue];
  resource.name = [JSON valueForKey: @"name" ];
  resource.description = [JSON valueForKey: @"description" ];
  
  return resource;
}

@end
