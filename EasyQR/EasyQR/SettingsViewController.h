//
//  SettingsViewController.h
//  EasyQR
//
//  Created by bluemol on 3/26/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) IBOutlet UIPickerView *imgSizePickerView;

@end
