//
//  LoginViewController.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "LoginViewController.h"
#import "GetGlueApi.h"
#import "User.h"
#import "UIViewController+ShowAlertOnError.h"

@interface LoginViewController ()

@property (nonatomic, assign) GetGlueApi * api;

- (void) startProgress;
- (void) stopProgress;

@end

@implementation LoginViewController

@synthesize emailField = _emailField, passwordField = _passwordField, api = _api, loginProgress = _loginProgress, rootViewController = _rootViewController;

- (void) startProgress {
  [self.loginProgress startAnimating];
}

- (void) stopProgress {
  [self.loginProgress stopAnimating];
}

- (IBAction) performLogin:(id)sender {
  
  [self.emailField resignFirstResponder];
  [self.passwordField resignFirstResponder];
  [self startProgress];
  
  [self.api performLoginWithUsername: self.emailField.text  
                         andPassword: self.passwordField.text 
                           onSuccess: ^( User * user ) {
                             [self stopProgress];
                             NSLog( @"Login com sucesso" );
                             [self.rootViewController goToMain];
                           }
                           orFailure: ^( NSError * error ) {
                             [self stopProgress];
                             [self showError: error  
                                        with: @"Não foi possível fazer o login" ];                             
                           } ];
}

- (IBAction) goToPassword:(id)sender {
  [self.passwordField becomeFirstResponder];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.api = [GetGlueApi defaultInstance];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender:(id)sender {
  
  if ( [segue.identifier isEqualToString: @"PerformSignUp" ] ) {
    [segue.destinationViewController setValue: self.rootViewController  forKey:  @"rootViewController"];
  }
  
}

- (void) dealloc {
  [_emailField release];
  [_passwordField release];
  [_loginProgress release];
  [super dealloc];
}

@end
