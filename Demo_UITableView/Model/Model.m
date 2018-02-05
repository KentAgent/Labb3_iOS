//
//  Model.m
//  Demo_UITableView
//
//  Created by Georgios on 2018-02-04.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)init{
    self = [super init];
    if (self) {

        self.todoList = [[NSMutableArray alloc] init];
        self.todoList = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"todo"] mutableCopy];
        
        self.readyList = [[NSMutableArray alloc] init];
        self.readyList = [[[NSUserDefaults standardUserDefaults] arrayForKey:@"ready"] mutableCopy];

    }
    return self;
}

-(void)saveItemToDatabase:(NSString *)item {
    //Create a list if list hasn't been created
    if (!self.todoList){
        self.todoList = @[].mutableCopy;
    }
    [self.todoList addObject:item];
    [self saveAllLists];
    NSLog(@"Todo list: %@", self.todoList);
}

-(void)readyItem:(NSString*)item {
    //Create a list if list hasn't been created
    if (!self.readyList){
        self.readyList = @[].mutableCopy;
    }
    [self.readyList addObject:item];
    [self saveAllLists];
    NSLog(@"Ready list: %@", self.readyList);
}

-(void)moveItemToReady:(NSInteger)listIndex {
    if (!self.readyList){
        self.readyList = @[].mutableCopy;
    }
    [self.readyList addObject:self.todoList[listIndex]];
    [self.todoList removeObjectAtIndex:listIndex];
    [self saveAllLists];
}

-(void) saveAllLists {
    [self.todoData setObject:self.todoList forKey:@"todo"];
    [self.todoData setObject:self.readyList forKey:@"ready"];
    [self.todoData synchronize];
}

-(void)removeItemFromDatabase:(NSInteger)listIndex {
    [self.todoList removeObjectAtIndex:listIndex];
    [self saveAllLists];
}

-(void)removeItemFromReadyList:(NSInteger)listIndex {
    [self.readyList removeObjectAtIndex:listIndex];
    [self.todoData setObject:self.readyList forKey:@"ready"];
}

-(NSInteger)listLength {
    return self.todoList.count;
}

-(NSInteger)readyLength {
    return self.readyList.count;
}

-(NSMutableArray *)getList {
    self.todoList = [self.todoData objectForKey:@"todo"];
    return self.todoList.mutableCopy;
}

@end
