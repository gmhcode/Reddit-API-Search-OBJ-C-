//
//  DVMPostController.m
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "DVMPostController.h"
#import <UIKit/UIKit.h>
@implementation DVMPostController

+(NSURL *)baseUrl
{
    return [NSURL URLWithString:@"https://www.reddit.com/r/"];
}



+ (void)fetchAllPostsForSubredditWithTitle:(NSString *)title withCompletion:(void (^)(NSArray<DVMPost *> * _Nullable))completion
{
    //1)construct URL
    NSURL *url = [[[DVMPostController baseUrl] URLByAppendingPathComponent: title] URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    //2) dataTask, JSONserialize
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"NO DATA");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &error];
        
        
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        
        NSArray *childrenArray = dataDictionary[@"children"];
        
        NSMutableArray *postsArray = [NSMutableArray new];
        
        for (NSDictionary *postDictionary in childrenArray){
            
            DVMPost *post = [[DVMPost alloc] initWithDictionary:postDictionary];
            
            [postsArray addObject: post];
        }
        
        completion(postsArray);
        
    }] resume];
    
    
}



+ (void) fetchImageWithPost:(DVMPost *)post complettion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageUrl =  [[NSURL alloc] initWithString: [post thumbnailUrlAsString]];
    
    if (!imageUrl) {
        NSLog(@"no url for image");
        completion(nil);
        return;
    }
    
    [[[NSURLSession sharedSession] dataTaskWithURL: imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s: %@", __PRETTY_FUNCTION__, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data){
            NSLog(@"no data was retrieved");
            completion(nil);
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData: data];
        
        if (image)
        {
            completion(image);
        }
        else {
            completion(nil);
        }
    }]resume];
    
    
    
    
    
    
}







@end
