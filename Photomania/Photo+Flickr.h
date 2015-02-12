//
//  Photo+Flickr.h
//  Photomania
//
//  Created by Zhuoran Li on 12/4/14.
//  Copyright (c) 2014 NYU. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)phtotWithFlickrInfo:(NSDictionary *)photoDictionary
         inManageObjectContext:(NSManagedObjectContext *)context;

+ (void)loadPhotosWithFlickrArray:(NSArray *)photos
         intoManagedObjectContext:(NSManagedObjectContext *)context;

@end
