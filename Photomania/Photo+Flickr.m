//
//  Photo+Flickr.m
//  Photomania
//
//  Created by Zhuoran Li on 12/4/14.
//  Copyright (c) 2014 NYU. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flickr)

+ (Photo *)phtotWithFlickrInfo:(NSDictionary *)photoDictionary
         inManageObjectContext:(NSManagedObjectContext *)context{
    Photo *photo = nil;
    
    NSString *unique = photoDictionary[FLICKR_PHOTO_ID];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@",unique];
    
    NSError *error;
    
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || ([matches count] > 1)) {
        //handle error
    }else if ([matches count]){
        // if there is a photo, get it
        photo = [matches firstObject];
    }else{
        // if there is no photo, insert it
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo"
                                              inManagedObjectContext:context];
        photo.title = [photoDictionary valueForKey:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKey:FLICKR_PHOTO_DESCRIPTION];
        photo.unique = unique;
        photo.imageURL = [[FlickrFetcher URLforPhoto:photoDictionary
                                              format:FlickrPhotoFormatLarge] absoluteString];
        NSString *photogrepherName = [photoDictionary valueForKeyPath: FLICKR_PHOTO_OWNER];
        photo.whoTook = [Photographer photographerWithName:photogrepherName
                                    inManagedObjectContext:context];
    }
    
    return photo;
}

+ (void)loadPhotosWithFlickrArray:(NSArray *)photos
         intoManagedObjectContext:(NSManagedObjectContext *)context{
    
}

@end
