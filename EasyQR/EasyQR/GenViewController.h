//
//  GenViewController.h
//  EasyQR
//
//  Created by bluemol on 3/18/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *qrImgView;
@property (nonatomic, strong) IBOutlet UIButton *saveBtn;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIImageView *frameImg;

@end
