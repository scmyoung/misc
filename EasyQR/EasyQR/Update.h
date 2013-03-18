//
//  Update.h
//  socialboo
//
//  Created by Tope on 20/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Update : NSObject

@property (nonatomic, copy) NSString* name;

@property (nonatomic, copy) NSString* date;

@property (nonatomic, retain) UIImage* avatar;


-(id)initWithName:(NSString*)theName andDate:(NSString*)theDate andAvatar:(UIImage*)theAvatar andUpdateText:(NSString*)text;


@end
