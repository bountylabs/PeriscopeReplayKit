//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfoMessageShare.h"
#import "PTVReplayKitServiceInfoUser.h"

@interface PTVReplayKitServiceInfoMessageShare ()
@property (nonatomic) NSString *service;
@property (nonatomic) PTVReplayKitServiceInfoUser *user;
@property (nonatomic) UIColor *color;
@end

@implementation PTVReplayKitServiceInfoMessageShare

+ (NSString *)type
{
    return @"share";
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.service = dictionary[@"service"];
        self.user = [PTVReplayKitServiceInfoUser newWithDictionary:dictionary[@"user"]];
        self.color = [self.class colorFromHexString:dictionary[@"color"]];
    }
    return self;
}

- (NSMutableDictionary *)encodeToDictionary
{
    NSMutableDictionary *dictionary = [super encodeToDictionary];
    if (self.service) {
        dictionary[@"service"] = self.service;
    }
    if (self.user) {
        dictionary[@"user"] = [self.user encodeToDictionary];
    }
    if (self.color) {
        dictionary[@"color"] = [self.class hexStringFromColor:self.color];
    }
    return dictionary;
}

@end
