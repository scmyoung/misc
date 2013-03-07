//
//  MAMenuLayer.m
//  ch2-match3
//  Creating Games with cocos2d for iPhone 2
//
//  Copyright 2012 Paul Nygard
//

#import "MAMenuLayer.h"
#import "MAFacebookScene.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation MAMenuLayer

-(id) init
{
    if( (self=[super init])) {
        
        CGSize wins = [[CCDirector sharedDirector] winSize];
        
        // Build a basic title
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Match 3" fontName:@"Marker Felt" fontSize:64];
        [label setColor:ccWHITE];
		label.position =  ccp( wins.width /2 , wins.height/2 );
		[self addChild: label];
        
        // Build the start menu
        CCLabelTTF *startGameLbl = [CCLabelTTF labelWithString:@"Start Game" fontName:@"Marker Felt" fontSize:22];
        CCMenuItemLabel *startGameItem = [CCMenuItemLabel itemWithLabel:startGameLbl target:self selector:@selector(startGame)];
        CCMenu *startMenu = [CCMenu menuWithItems:startGameItem, nil];
        [startMenu setPosition:ccp(wins.width/2, wins.height/4)];
        [self addChild:startMenu];
        
        // Build the start menu
        CCLabelTTF *fbLogout = [CCLabelTTF labelWithString:@"Facebook Logout" fontName:@"Marker Felt" fontSize:22];
        CCMenuItemLabel *fbLogoutItem = [CCMenuItemLabel itemWithLabel:fbLogout target:self selector:@selector(fbLogout)];
        CCMenu *fbLogoutMenu = [CCMenu menuWithItems:fbLogoutItem, nil];
        [fbLogoutMenu setPosition:ccp(wins.width/2, wins.height/8)];
        [self addChild:fbLogoutMenu];
	}
    
    return self;
}

-(void) startGame {
    // Start the game, called by the menu item
    [[CCDirector sharedDirector] replaceScene:[MAPlayfieldScene scene]];
}

-(void) fbLogout {
    [FBSession.activeSession closeAndClearTokenInformation];
    [[CCDirector sharedDirector] replaceScene:[MAFacebookScene scene]];
}

@end
