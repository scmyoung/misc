//
//  Update.m
//  socialboo
//
//  Created by Tope on 20/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Update.h"

@implementation Update

@synthesize name, date, avatar;


-(id)initWithName:(NSString*)theName andDate:(NSString*)theDate andAvatar:(UIImage*)theAvatar andUpdateText:(NSString*)text
{
    self = [super init];
    
    if(self)
    {
        self.name = theName;
        self.date = theDate;
        self.avatar = theAvatar;
    }
    
    return self;
}
@end
