//
//  ResourceViewController.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resource.h"

@interface ResourceViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel * nameLabel;
@property (nonatomic, strong) IBOutlet UITextView * descriptionView;
@property (nonatomic, assign) Resource * resource;

@end
