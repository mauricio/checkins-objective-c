//
//  User.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) long recordId;
@property (nonatomic, copy) NSString * email;
@property (nonatomic, copy) NSString * name;

+ (User *) fromJSON: (id) JSON;

@end
