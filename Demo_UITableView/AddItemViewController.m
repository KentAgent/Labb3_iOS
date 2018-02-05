//
//  AddItemViewController.m
//  Demo_UITableView
//
//  Created by Georgios on 2018-02-01.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addItemButton:(id)sender {
//    [self.items addObject:self.itemName.text];
//    [self.navigationController popViewControllerAnimated:YES];
//
//    //Add to NSUserDefaults
//    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
//    [savedData setObject:self.items forKey:@"itemsData"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
