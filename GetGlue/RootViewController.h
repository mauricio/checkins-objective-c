//
//  RootViewController.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, strong) UIStoryboard * loginStoryboard;
@property (nonatomic, strong) UIStoryboard * mainStoryboard;
@property (nonatomic, strong) UIViewController * loginController;
@property (nonatomic, strong) UIViewController * mainController;

- (void) goToMain;
- (void) goToLogin;

@end
