//
//  SignUpViewController.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface SignUpViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField * emailField;
@property (nonatomic, strong) IBOutlet UITextField * passwordField;
@property (nonatomic, assign) RootViewController * rootViewController;

- (IBAction) cancel: (id) sender;
- (IBAction) performSignUp: (id) sender;
- (IBAction) goToPassword: (id) sender;

@end
