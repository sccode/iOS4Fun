//
//  Event.h
//  SimpleAgenda
//
//  Created by Sophie Che on 4/23/15.
//  Copyright (c) 2015 F&F. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property(nonatomic, copy) NSString *eventName;
@property(nonatomic, copy) NSString *startDate;

@end
