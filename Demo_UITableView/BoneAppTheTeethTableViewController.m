//
//  BoneAppTheTeethTableViewController.m
//  Demo_UITableView
//
//  Created by Georgios on 2018-02-01.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import "ToDoErViewController.h"
#import "AddItemViewController.h"

@interface ToDoErViewController ()
@property (nonatomic) NSMutableArray *list;
@property (nonatomic) NSUserDefaults *savedData;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *todoText;
@property (weak, nonatomic) IBOutlet UITextField *toDoText;

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *handleLongPress;

@end

@implementation ToDoErViewController

- (void)viewDidLoad {
    //Load data from NSUserDefaults
    self.savedData = [NSUserDefaults standardUserDefaults];
    self.list = [self.savedData objectForKey:@"itemsData"];
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.list = @[@"Bananadog", @"Cornbread", @"Hotdog", @"Spaghettitacos"].mutableCopy;
    self.list = self.list.mutableCopy;
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        CGPoint p = [sender locationInView:self.tableView];
        
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
        if (indexPath == nil) {
            NSLog(@"long press on table view but not on a row");
        } else {
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            if (cell.isHighlighted) {
                NSLog(@"long press on table view at section %ld row %ld", indexPath.section, indexPath.row);
            }
        }
    }
}

    //Add from toDoText to NSUserDefaults on addItemButton click
- (IBAction)addItemButton:(id)sender {
    [self.list addObject:self.toDoText.text];
    [self.savedData setObject:self.list forKey:@"itemsData"];
    [self.tableView reloadData];
    
    //Hide Keyboard after add-button is clicked
    [self.toDoText resignFirstResponder];
    
    [self refreshToDoText];
}

-(void)refreshToDoText {
    [self.toDoText setText:@"What to do...?"];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
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
    //[self.savedData objectForKey:@""];
    return self.list.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.font = [UIFont fontWithName:@"System - Thin" size:20.0f];
    cell.textLabel.text = self.list[indexPath.row];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.list removeObjectAtIndex:indexPath.row];
        [self.savedData setObject:self.list forKey:@"itemsData"];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
//    if ([segue.identifier isEqualToString:@"Info"]) {
//        UITableViewCell *cell = sender;
//        UIViewController *info = [segue destinationViewController];
//        info.title = cell.textLabel.text;
//    } else if ([segue.identifier isEqualToString:@"AddItem"]) {
//        AddItemViewController *add = [segue destinationViewController];
//        add.items = self.list;
//    }
    
}


@end
