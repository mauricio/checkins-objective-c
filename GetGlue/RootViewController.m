//
//  RootViewController.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize mainStoryboard = _mainStoryboard, mainController = _mainController, loginController = _loginController, loginStoryboard = _loginStoryboard;

- (void) dealloc {
  [_mainController release];
  [_mainStoryboard release];
  [_loginStoryboard release];
  [_loginController release];
  [super dealloc];
}

- (void) goToMain {
  [self.mainController willMoveToParentViewController: self];
  [self addChildViewController: self.mainController ];
  [self.loginController willMoveToParentViewController: nil]; 
  
  [self transitionFromViewController: self.loginController 
   
   
                    toViewController: self.mainController 
                            duration: 2 
                             options: UIViewAnimationOptionTransitionFlipFromTop
                          animations: ^() {} 
                          completion: ^( BOOL completed) {
                            
                            [self.loginController removeFromParentViewController];
                            [self.mainController didMoveToParentViewController: self];                            
                            
                          }];
}

- (void) goToLogin {
  [self.loginController willMoveToParentViewController: self ];
  [self addChildViewController: self.loginController ];
  [self.view addSubview: self.loginController.view ];
  [self.loginController didMoveToParentViewController: self ];  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.mainStoryboard = [UIStoryboard storyboardWithName: @"Main"  bundle: nil];
  self.loginStoryboard = [UIStoryboard storyboardWithName: @"Login"  bundle: nil];
  
  self.loginController = [self.loginStoryboard instantiateInitialViewController];
  self.mainController = [self.mainStoryboard instantiateInitialViewController];

  [self.loginController setValue: self  forKey: @"rootViewController" ];
  
  [self goToLogin];
  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  self.mainStoryboard = nil;
  self.loginStoryboard = nil;
  self.loginController = nil;
  self.mainController = nil;
}

@end
