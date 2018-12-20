//
//  DVMPostController.h
//  Reddit OBJC
//
//  Created by Greg Hughes on 12/19/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVMPost.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DVMPostController : NSObject


+(void) fetchAllPostsForSubredditWithTitle:(NSString *)title
                            withCompletion:(void (^) (NSArray<DVMPost *> * _Nullable posts)) completion;


+(void)fetchImageWithPost: (DVMPost *) post
              complettion: (void (^) (UIImage * _Nullable image))completion;



@end

NS_ASSUME_NONNULL_END
