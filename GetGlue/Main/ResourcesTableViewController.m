//
//  ResourcesTableViewController.m
//  GetGlue
//
//  Created by Maurício Linhares on 3/25/12.
//  Copyright (c) 2012 OfficeDrop. All rights reserved.
//

#import "ResourcesTableViewController.h"
#import "GetGlueApi.h"
#import "Resource.h"
#import "UIViewController+ShowAlertOnError.h"

@interface ResourcesTableViewController ()

@property (nonatomic, assign) BOOL loading;
@property (nonatomic, assign) Resource * resource;

@end

@implementation ResourcesTableViewController

@synthesize resources = _resources, loading = _loading, resource = _resource;

- (void) dealloc {
  [_resources release];
  [super dealloc];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.resources = [NSArray array];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.resources = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
  if (self.loading || self.resources.count == 0) {
    return 1;  
  } else {
    return self.resources.count;
  }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString * NoResultsCell = @"NoResultsCell";
  static NSString * LoadingCell = @"LoadingCell";
  static NSString * ResultCell = @"ResourceCell";

  UITableViewCell * cell = nil;
  
  if ( self.loading ) {
    cell = [tableView dequeueReusableCellWithIdentifier: LoadingCell ];
  } else {
    if ( self.resources.count == 0 ) {
      cell = [tableView dequeueReusableCellWithIdentifier: NoResultsCell ];
    } else {
      Resource * resource = [self.resources objectAtIndex: indexPath.row ];
      cell = [tableView dequeueReusableCellWithIdentifier: ResultCell ];

      UILabel * label = ( UILabel * ) [cell viewWithTag: 1 ];
      label.text = resource.name;
    }
  }
      
  return cell;
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar 
{
  [searchBar resignFirstResponder];
  self.loading = NO;
  [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar 
{
  self.loading = YES;
  [searchBar resignFirstResponder];
  [self.tableView reloadData];
  
  [[GetGlueApi defaultInstance] searchResourcesBy: searchBar.text
                                        onSuccess: ^( NSArray * resourcesFound ) {
                                          self.resources = resourcesFound;
                                          self.loading = NO;
                                          [self.tableView reloadData];
                                        } 
                                        orFailure: ^(NSError * error) {
                                          [self showError: error with: @"Falhou ao carregar shows" ];
                                          self.loading = NO;
                                          [self.tableView reloadData];
                                        } ];
  
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
  if ( [segue.identifier isEqualToString: @"ViewResource" ] ) {
    self.resource = [self.resources objectAtIndex: self.tableView.indexPathForSelectedRow.row ];
    
    [segue.destinationViewController setValue: self.resource  forKey: @"resource"];
  }
  
}


@end