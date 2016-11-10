//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfoMessageScreenshot.h"
#import "PTVReplayKitServiceInfoUser.h"

@interface PTVReplayKitServiceInfoMessageScreenshot ()
@property (nonatomic) PTVReplayKitServiceInfoUser *user;
@property (nonatomic) UIColor *color;
@end

@implementation PTVReplayKitServiceInfoMessageScreenshot

+ (NSString *)type
{
    return @"screenshot";
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.user = [PTVReplayKitServiceInfoUser newWithDictionary:dictionary[@"user"]];
        self.color = [self.class colorFromHexString:dictionary[@"color"]];
    }
    return self;
}

- (NSMutableDictionary *)encodeToDictionary
{
    NSMutableDictionary *dictionary = [super encodeToDictionary];
    if (self.user) {
        dictionary[@"user"] = [self.user encodeToDictionary];
    }
    if (self.color) {
        dictionary[@"color"] = [self.class hexStringFromColor:self.color];
    }
    return dictionary;
}

@end
