//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfoMessageViewerCount.h"

@interface PTVReplayKitServiceInfoMessageViewerCount ()
@property (nonatomic) NSUInteger viewerCount;
@end

@implementation PTVReplayKitServiceInfoMessageViewerCount

+ (NSString *)type
{
    return @"viewer_count";
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.viewerCount = [dictionary[@"viewer_count"] unsignedIntegerValue];
    }
    return self;
}

- (NSMutableDictionary *)encodeToDictionary
{
    NSMutableDictionary *dictionary = [super encodeToDictionary];
    dictionary[@"viewer_count"] = @(self.viewerCount);
    return dictionary;
}

@end