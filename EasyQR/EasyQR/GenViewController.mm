//
//  GenViewController.m
//  EasyQR
//
//  Created by bluemol on 3/18/13.
//  Copyright (c) 2013 Yongmo. All rights reserved.
//

#import "GenViewController.h"
#import "QREncoder.h"

@interface GenViewController () {
    NSString *candidateText;
    UIImage *qrcodeImage;
}

@end

@implementation GenViewController

@synthesize qrImgView;
@synthesize textField;
@synthesize saveBtn;
@synthesize frameImg;

- (IBAction)generateQR:(id)sender
{
    [textField resignFirstResponder];
    
    //the qrcode is square. now we make it 250 pixels wide
    int qrcodeImageDimension = 250;
    
    //the string can be very long
    //NSString* aVeryLongURL = @"http://thelongestlistofthelongeststuffatthelongestdomainnameatlonglast.com/";
    
    candidateText = textField.text;
    //NSLog(@"%@", candidateText);
    
    if (candidateText != nil && candidateText.length != 0) {
        //first encode the string into a matrix of bools, TRUE for black dot and FALSE for white. Let the encoder decide the error correction level and version
        DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QR_ECLEVEL_AUTO version:QR_VERSION_AUTO string:candidateText];
        
        //then render the matrix
        qrcodeImage = [QREncoder renderDataMatrix:qrMatrix imageDimension:qrcodeImageDimension];
        
        
        //put the image into the view
        [qrImgView setImage:qrcodeImage];
        
        /*
         //put the image into the view
         UIImageView* qrcodeImageView = [[UIImageView alloc] initWithImage:qrcodeImage];
         CGRect parentFrame = self.view.frame;
         CGRect tabBarFrame = self.tabBarController.tabBar.frame;
         
         //center the image
         CGFloat x = (parentFrame.size.width - qrcodeImageDimension) / 2.0;
         CGFloat y = (parentFrame.size.height - qrcodeImageDimension - tabBarFrame.size.height) / 2.0;
         CGRect qrcodeImageViewFrame = CGRectMake(x, y, qrcodeImageDimension, qrcodeImageDimension);
         [qrcodeImageView setFrame:qrcodeImageViewFrame];
         
         //and that's it!
         [self.view addSubview:qrcodeImageView];
         */
        
        // show save button
        saveBtn.hidden = NO;
        frameImg.hidden = NO;
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Generate QR"
                              message: @"Candidate Text is Empaty."
                              delegate: nil
                              cancelButtonTitle:@"Retry"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    if (error) {
        // Do anything needed to handle the error or display it to the user
    } else {
        // .... do anything you want here to handle
        // .... when the image has been saved in the photo album
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save Result"
                              message: @"Successfully Saved QR Image."
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)saveImage:(id)sender
{
    UIImageWriteToSavedPhotosAlbum(qrcodeImage, self, @selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:), nil);
}

- (BOOL)textFieldShouldReturn:(UITextField *)tf {
    [tf resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)tf{
    
    //NSLog(@"%@",tf.text);
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
    //[textField becomeFirstResponder];
    self.textField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //[textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
