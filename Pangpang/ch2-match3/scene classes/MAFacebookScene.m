//
//  MAFacebookScene.m
//  ch2-match3
//
//  Created by bluemol on 3/7/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MAFacebookScene.h"
#import "MAFacebookLayer.h"


@implementation MAFacebookScene

+(id)scene {
    return( [ [ [ self alloc ] init ] autorelease ] );
}

-(id) init
{
	if( (self=[super init])) {
        
        MAFacebookLayer *layer = [MAFacebookLayer node];
        [self addChild: layer];
	}
	return self;
}

@end
