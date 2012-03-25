//
//  Resource.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic, assign) long recordId;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * description;

+ (Resource *) fromJSON: (id) JSON;

@end
