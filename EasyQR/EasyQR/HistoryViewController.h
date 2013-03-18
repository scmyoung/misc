//
//  HistoryViewController.h
//  EasyQR
//
//  Created by bluemol on 3/18/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *historyTableView;
@property (nonatomic, strong) NSArray* updates;


@end
