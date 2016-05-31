//
//  InitialCreateListViewController.m
//  iWish
//
//  Created by Elena Maso Willen on 30/05/2016.
//  Copyright © 2016 Elena. All rights reserved.
//

#import "InitialCreateListViewController.h"

#import "AppDelegate.h"
#import <CoreData/CoreData.h>

// Core Data Managed Objects
#import "List.h"



@interface InitialCreateListViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *initialListNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

- (IBAction)createButtonPressed:(id)sender;
- (IBAction)loginButtonPressed:(id)sender;

@end

@implementation InitialCreateListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.createButton setEnabled:NO];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""]) {
        [self.createButton setEnabled:YES];
        rc = YES;
        [textField resignFirstResponder];
    }
    return rc;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action handlers

- (IBAction)createButtonPressed:(id)sender {
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;

    if (![self.initialListNameTextField.text isEqualToString:@""]) {
        
        List *firstList = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:appDelegate.managedObjectContext];
        firstList.name = self.initialListNameTextField.text;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:initialListCreatedNotification object:nil];

    }
    NSError *error = nil;
    [appDelegate.managedObjectContext save:&error];
    if (error) {
        NSLog(@"Core Data could not save: %@", [error localizedDescription]);
    }
    
}

- (IBAction)loginButtonPressed:(id)sender {
    
}

@end








