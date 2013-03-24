//
//  HistoryViewController.m
//  EasyQR
//
//  Created by bluemol on 3/18/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import "HistoryViewController.h"
#import "ThemeListCell.h"
#import "Update.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

@synthesize historyTableView, updates;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    [historyTableView setDelegate:self];
    [historyTableView setDataSource:self];
    [historyTableView setBackgroundColor:[UIColor clearColor]];
    [historyTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-gunmetal.jpg"]];
    [self.view setBackgroundColor:color];
    //historyTableView.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ThemeListCell";
    ThemeListCell *cell = (ThemeListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    Update* update = [updates objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:@"hello"];
    [cell.dateLabel setText:@"2013-03-13"];
    [cell.avatarImageView setImage:[UIImage imageNamed:@"button.png"]];
    
    return cell;    
}

#pragma tableview delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [updates count];
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"detail" sender:self];
}

@end
