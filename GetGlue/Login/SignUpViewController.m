//
//  SignUpViewController.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/24/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "SignUpViewController.h"
#import "GetGlueApi.h"
#import "User.h"

@interface SignUpViewController ()

@property (nonatomic, assign) GetGlueApi * api;

@end

@implementation SignUpViewController

@synthesize emailField = _emailField, passwordField = _passwordField, api = _api, rootViewController = _rootViewController;

- (void) dealloc {
  [_emailField release];
  [_passwordField release];
  [super dealloc];
}

- (IBAction) cancel:(id)sender {
  [self dismissModalViewControllerAnimated: YES];
}

- (IBAction) goToPassword: (id) sender {
  [self.passwordField becomeFirstResponder];
}

- (IBAction) performSignUp:(id)sender {
  
  NSString * email = self.emailField.text;
  NSString * password = self.passwordField.text;
  
  [self.api createUserWith: email
               andPassword: password
                 onSuccess: ^( User * user ) {
                 
                  [self.api setEmail: email  
                         andPassword: password];
                   
                   NSLog( @"Usuário criado com sucesso %@", user );                   
                   [self dismissViewControllerAnimated: YES 
                                            completion:^() {                   
                     [self.rootViewController goToMain];
                   }];
                   
                 }
                 orFailure: ^( NSError * error) {
                   
                   NSString * message = error.localizedDescription;
                   UIAlertView * view = [[ UIAlertView alloc ] initWithTitle: @"Não foi possível criar conta" message: message delegate: nil cancelButtonTitle: @"Ok" otherButtonTitles: nil]; 
                   [view show];
                   [view release];
                   
                 } ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  self.api = [GetGlueApi defaultInstance];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end
