//
//  MAFacebookLayer.m
//  ch2-match3
//
//  Created by bluemol on 3/7/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MAFacebookLayer.h"
#import "AppDelegate.h"


@implementation MAFacebookLayer

// Facebook Login Logic
- (void)facebookLogin
{
    AppController *appDelegate = (AppController *)[[UIApplication sharedApplication] delegate];
    [appDelegate openSession];
}

-(id) init
{
    if( (self=[super init])) {
        CCSprite *background;
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
            background = [CCSprite spriteWithFile:@"fb_bg.png"];
            //background.rotation = 90;
        } else {
            background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
        }
        background.position = ccp(size.width/2, size.height/2);
        
        // add the label as a child to this Layer
        [self addChild: background];
        
        CCMenuItem *starMenuItem = [CCMenuItemImage
                                    itemWithNormalImage:@"Icon.png" selectedImage:@"Icon@2x.png" target:self selector:@selector(facebookLogin)];
        starMenuItem.position = ccp(60, 60);
        CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
        starMenu.position = CGPointZero;
        [self addChild:starMenu];
    }

    return self;
}

@end
