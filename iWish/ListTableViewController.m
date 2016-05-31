//
//  ListTableViewController.m
//  iWish
//
//  Created by Elena Maso Willen on 31/05/2016.
//  Copyright © 2016 Elena. All rights reserved.
//

#import "ListTableViewController.h"

#import "AppDelegate.h"
#import <CoreData/CoreData.h>

#import "List.h"

@interface ListTableViewController ()


@property (nonatomic, strong) NSMutableArray *myLists;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ListTableViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"List" inManagedObjectContext:self.appDelegate.managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *fetchResults = [self.appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        // Fetch request encountered error
        NSLog(@"Fetch request failed: %@", [error localizedDescription]);
    } else {
        for (List *aList in fetchResults) {
            NSPredicate *listSearch = [NSPredicate predicateWithFormat:@"name=%@", aList.name];
            NSArray *foundLists = [self.myLists filteredArrayUsingPredicate:listSearch];
            if (foundLists.count == 0) {
                [self.myLists addObject:aList];
            }
        }
        [self.tableView reloadData];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"My Lists";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myLists.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
