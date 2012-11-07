//
//  MasterViewController.m
//  ContactsDemo
//
//  Created by Lancy on 5/11/12.
//  Copyright (c) 2012 Lancy. All rights reserved.
//

#import "MasterViewController.h"
#import "ABContactsHelper.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSArray *_contacts;
}

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadContactData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ABContact *contact = [_contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = [contact compositeName];
    return cell;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ABContact *contact = [_contacts objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:contact];
    }
}

- (void)loadContactData
{
    _contacts = [ABContactsHelper contacts];
    [self.tableView reloadData];
}

@end
