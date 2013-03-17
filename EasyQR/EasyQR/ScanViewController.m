//
//  ScanViewController.m
//  EasyQR
//
//  Created by bluemol on 3/11/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController ()

@end

@implementation ScanViewController

ZBarReaderViewController *camaraReader;
ZBarReaderController *photoReader;

- (IBAction)scanFromCamara:(id)sender
{
    // ADD: present a barcode reader that scans from the camera feed
    camaraReader = [ZBarReaderViewController new];
    camaraReader.readerDelegate = self;
    camaraReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = camaraReader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentViewController:camaraReader animated:YES completion:nil];
}

- (IBAction)scanFromGallary:(id)sender
{
    // ADD: present a barcode reader that scans from the gallery
    ZBarReaderController *photoReader = [ZBarReaderController new];
    photoReader.readerDelegate = self;
    
    if([ZBarReaderController isSourceTypeAvailable:
        UIImagePickerControllerSourceTypePhotoLibrary])
        photoReader.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [photoReader.scanner setSymbology: ZBAR_I25
                          config: ZBAR_CFG_ENABLE
                              to: 0];
    
    [self presentViewController:photoReader animated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode image
    //resultImage.image =
    //[info objectForKey: UIImagePickerControllerOriginalImage];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"EasyQR"
                          message: symbol.data  
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
    
    if (camaraReader != nil) {
        [camaraReader dismissViewControllerAnimated:YES completion:nil];
        camaraReader = nil;
    }
    
    if (photoReader != nil) {
        [photoReader dismissViewControllerAnimated:YES completion:nil];
        camaraReader = nil;
    }

}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
