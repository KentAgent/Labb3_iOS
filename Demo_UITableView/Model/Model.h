//
//  Model.h
//  Demo_UITableView
//
//  Created by Georgios on 2018-02-04.
//  Copyright © 2018 Georgios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray *todoList;
@property (nonatomic) NSMutableArray *readyList;
@property (nonatomic) NSUserDefaults *todoData;

//-(void)saveToDoItem;
//-(void)saveListToDatabase;
-(void)saveItemToDatabase:(NSString*)item;
-(void)removeItemFromDatabase:(NSInteger)listIndex;
-(void)readyItem:(NSString*)item;
-(NSInteger)listLength;
-(NSInteger)readyLength;
-(NSMutableArray*)getList;
-(void)moveItemToReady:(NSInteger)listIndex;
-(void)removeItemFromReadyList:(NSInteger)listIndex;

@end
