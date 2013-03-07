//
//  IntroLayer.m
//  ch2-match3
//  Creating Games with cocos2d for iPhone 2
//
//  Copyright 2012 Paul Nygard
//

// Import the interfaces
#import "IntroLayer.h"
#import "MAMenuScene.h"
#import "MAFacebookScene.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"

#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


// 
-(void) onEnter
{
	[super onEnter];

	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	
	if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
		background = [CCSprite spriteWithFile:@"fb_bg.png"];
		//background.rotation = 90;
	} else {
		background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
	}
	background.position = ccp(size.width/2, size.height/2);
    
	// In one second transition to the new scene
	[self scheduleOnce:@selector(makeTransition:) delay:1];

}

-(void) makeTransition:(ccTime)dt
{
    // Handle Facebook Login Info
    // See if we have a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // To-do, show logged in view
        AppController *appDelegate = (AppController *)[[UIApplication sharedApplication] delegate];
        [appDelegate openSession];
    } else {
        // No, display the login page.
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MAFacebookScene scene]]];
    }
	
}
@end
