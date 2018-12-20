//
//  Post.h
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DVMPost : NSObject

@property(nonatomic, copy, readonly, nullable)NSString *thumbnailUrlAsString;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly)NSNumber *commentCount;
@property (nonatomic, readonly)NSNumber *upVotes;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;






@end

NS_ASSUME_NONNULL_END
