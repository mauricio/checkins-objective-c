//
//  UIViewController+ShowAlertOnError.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "UIViewController+ShowAlertOnError.h"

@implementation UIViewController (ShowAlertOnError)

- (void) showError:(NSError *)error with:(NSString *)title {  
  NSString * message = error.localizedDescription;
  UIAlertView * view = [[ UIAlertView alloc ] initWithTitle: title 
                                                    message: message 
                                                   delegate: nil 
                                          cancelButtonTitle: @"Ok" 
                                          otherButtonTitles: nil]; 
  [view show];
  [view release];    
}

@end
