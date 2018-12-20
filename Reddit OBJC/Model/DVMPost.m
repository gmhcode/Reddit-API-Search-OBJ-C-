//
//  Post.m
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import "DVMPost.h"

@implementation DVMPost

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    //1)pull all values out of dictionary, if not, return nil
    NSDictionary *dataDictionary = dictionary[@"data"];
    NSString *title = dataDictionary[@"title"];
    NSNumber *upvotes = dataDictionary[@"ups"];
    NSNumber *commentCount = dataDictionary[@"num_comments"];
    
    
    NSString *thumbnailUrlAsString = dataDictionary[@"thumbnail"];
    
    
    if (![title isKindOfClass:[NSString class]]
        || ![upvotes isKindOfClass:[NSNumber class]]
        || ![commentCount isKindOfClass:[NSNumber class]]) {
        
        return nil;
    }
    
    
    //2) initialize object properties using values from dictionary
    
    self = [super init];
    
    if (self) {
        
        _title = title;
        _commentCount = commentCount;
        _upVotes = upvotes;
        _thumbnailUrlAsString = thumbnailUrlAsString;
        
    }
    return self;
}

@end
