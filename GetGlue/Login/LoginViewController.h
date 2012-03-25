//
//  LoginViewController.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface LoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField * emailField;
@property (nonatomic, strong) IBOutlet UITextField * passwordField;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView * loginProgress;
@property (nonatomic, assign) RootViewController * rootViewController;

- (IBAction) performLogin: (id) sender;
- (IBAction) goToPassword: (id) sender;

@end
