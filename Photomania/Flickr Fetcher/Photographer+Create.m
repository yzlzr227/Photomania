//
//  Photographer+Create.m
//  Photomania
//
//  Created by Zhuoran Li on 12/4/14.
//  Copyright (c) 2014 NYU. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+ (Photographer *)photographerWithName:(NSString *)name
                inManagedObjectContext:(NSManagedObjectContext *)context{
    Photographer *photographer = nil;
    
    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || error || [matches count] > 1) {
            //handle error
        }else if (![matches count]){
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer"
                                                         inManagedObjectContext:context];
            photographer.name = name;
        }else{
            photographer = [matches firstObject];
        }
        
    }
    
    return photographer;
}

@end
