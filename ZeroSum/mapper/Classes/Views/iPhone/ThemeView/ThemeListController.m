//
//  ViewController.m
//  PodRadio
//
//  Created by Tope on 08/11/2011.
//  Copyright (c) 2011 AppDesignVault. All rights reserved.
//

#import "ThemeListController.h"
#import "ThemeListCell.h"
#import "DataLoader.h"
#import "Model.h"
#import "DetailThemeController.h"
#import "AppDelegate.h"

#define GOOGLE_PLACE_BASE_URL @"https://maps.googleapis.com/maps/api/place/nearbysearch/"
#define GOOGLE_API_KEY @"AIzaSyAtK3jGI1fZaf_ykuLnq1T3ZMJ440S4vYc"
#define RADIUS @"1000"
#define OUTPUT @"json"
#define SENSOR @"true"
#define TYPES @"restaurant"


@interface ThemeListController ()
{
    CLLocationManager *locMgr;
    NSString *location;
    
    
    NSDictionary *oneRes;
    NSString *name;
    NSString *geometry_lat;
    NSString *geometry_lng ;
    NSString *formatted_address;
    NSString *rating ;

    NSData *googleJson;
}

- (void)customizeTabbar;

@end



@implementation ThemeListController
@synthesize tabBar;
@synthesize tableListView, models, furthestLabel, nearestLabel;

#pragma mark - View lifecycle

- (void)setGooglePlaceJson:(NSData *)data
{
    googleJson = data;
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:googleJson
                          
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    for (int i=0; i<1; i++) {
        // NSLog(@"Google Data: %@", [places objectAtIndex:i]);
        oneRes = [places objectAtIndex:i];
        name = [oneRes objectForKey:@"name"];
        geometry_lat = [[[oneRes objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"];
        geometry_lng = [[[oneRes objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"];
        formatted_address = [oneRes objectForKey:@"vicinity"];
        rating = [oneRes objectForKey:@"rating"];
        
        NSLog(@"id - %@", name);
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    self.models = [DataLoader loadSampleData];
    
    [nearestLabel setText:@"0.43"];
    [furthestLabel setText:@"4.34"];
    
    [tableListView setDelegate:self];
    [tableListView setDataSource:self];
    
    [tableListView setBackgroundColor:[UIColor clearColor]];
    [tableListView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage tallImageNamed:@"bg.png"]];
    [self.view setBackgroundColor:bgColor];
    
    [self customizeTabbar];
    [self.tabBar setSelectedItem:(self.tabBar.items)[0]];
}

- (void)viewDidUnload {
    [self setTabBar:nil];
    [super viewDidUnload];
}



- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Visual stuff

- (void)customizeTabbar {
    UITabBarItem *tabItem1 = (self.tabBar.items)[0];
    UIImage* icon1 = [UIImage tallImageNamed:@"tabbar-icon1.png"];
    [tabItem1 setFinishedSelectedImage:icon1 withFinishedUnselectedImage:icon1];
    
    UITabBarItem *tabItem2 = (self.tabBar.items)[1];
    UIImage* icon2 = [UIImage tallImageNamed:@"tabbar-icon2.png"];
    [tabItem2 setFinishedSelectedImage:icon2 withFinishedUnselectedImage:icon2];
    
    UITabBarItem *tabItem3 = (self.tabBar.items)[2];
    UIImage* icon3 = [UIImage tallImageNamed:@"tabbar-icon3.png"];
    [tabItem3 setFinishedSelectedImage:icon3 withFinishedUnselectedImage:icon3];
    
    UITabBarItem *tabItem4 = (self.tabBar.items)[3];
    UIImage* icon4 = [UIImage tallImageNamed:@"tabbar-icon4.png"];
    [tabItem4 setFinishedSelectedImage:icon4 withFinishedUnselectedImage:icon4];
}


#pragma mark - Table View datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ThemeListCell";

    ThemeListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
    Model* model = models[indexPath.row];
    
    [cell.titleLabel setText:name];
    [cell.locationLabel setText:model.location];
    [cell.paidTypeLabel setText:model.paidType];
    [cell.distanceMetricLabel setText:model.distanceMetric];
    [cell.distanceLabel setText:model.distance];
    
    [cell.paidTypeLabel setTextColor:[[AppDelegate instance].colorSwitcher textColor]];
    [cell.locationLabel setTextColor:[[AppDelegate instance].colorSwitcher textColor]];
    
    return cell;    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [models count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailThemeController* detail = segue.destinationViewController;
    
    Model* model = models[[[tableListView indexPathForSelectedRow] row]];    
    [detail setModel:model];    
}






@end
