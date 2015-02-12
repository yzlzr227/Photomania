//
//  Photographer+Create.h
//  Photomania
//
//  Created by Zhuoran Li on 12/4/14.
//  Copyright (c) 2014 NYU. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context;

@end
