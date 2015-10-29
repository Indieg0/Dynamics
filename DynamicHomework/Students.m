//
//  Students.m
//  DynamicHomework
//
//  Created by Kirill on 29.10.15.
//  Copyright © 2015 Kirill. All rights reserved.
//

#import "Students.h"

@implementation Students


- (id) initWithName: (NSString*) name andLastName: (NSString*) lastName andMark:(NSInteger) mark {
   
    self = [super init];
    
    if (self) {
        self.name = name;
        self.lastName = lastName;
        self.mark = mark;
    }
    
    return self;

}


@end
