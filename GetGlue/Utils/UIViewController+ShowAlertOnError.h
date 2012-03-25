//
//  UIViewController+ShowAlertOnError.h
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ShowAlertOnError)

- (void) showError: ( NSError * ) error 
              with: (NSString *) title;

@end
