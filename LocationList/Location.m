//
//  Location.m
//  LocationList
//
//  Created by Joffrey Mann on 5/12/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "Location.h"

@implementation Location

-(id)initWithName:(NSString *)name andAddress:(NSString *)address andDescription:(NSString *)descriptionString
{
    self = [super init];
    
    if(self)
    {
        _name = name;
        _address = address;
        _descriptionString = descriptionString;
    }
    
    return self;
}

-(id)init
{
    return [self initWithName:nil andAddress:nil andDescription:nil];
}

@end
