//
//  ViewController.h
//  PodRadio
//
//  Created by Tope on 08/11/2011.
//  Copyright (c) 2011 AppDesignVault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeListController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) IBOutlet UITableView* tableListView;

@property (nonatomic, strong) IBOutlet UILabel* nearestLabel;

@property (nonatomic, strong) IBOutlet UILabel* furthestLabel;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;


@property (nonatomic, retain) NSArray* models;


@end
