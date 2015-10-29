//
//  Students.h
//  DynamicHomework
//
//  Created by Kirill on 29.10.15.
//  Copyright © 2015 Kirill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Students : NSObject
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) NSInteger mark;

- (id) initWithName: (NSString*) name andLastName: (NSString*) lastName andMark:(NSInteger) mark;
    


@end
