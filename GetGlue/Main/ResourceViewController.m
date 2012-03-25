//
//  ResourceViewController.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "ResourceViewController.h"

@interface ResourceViewController ()

@end

@implementation ResourceViewController

@synthesize nameLabel = _nameLabel, descriptionView = _descriptionView, resource = _resource;

- (void) dealloc {
  [_nameLabel release];
  [_descriptionView release];
  [super dealloc];
}

- (void) viewWillAppear:(BOOL)animated {
  NSLog( @"View will appear em resource_view_controller" );
  
  [super viewWillAppear: animated];
  self.nameLabel.text = self.resource.name;
  self.descriptionView.text = self.resource.description;
}

@end
