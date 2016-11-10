//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfoUser.h"

@interface PTVReplayKitServiceInfoUser ()
@property (nonatomic) NSString *id;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *displayName;
@end

@implementation PTVReplayKitServiceInfoUser

+ (instancetype)newWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.id = dictionary[@"id"];
        self.imageUrl = dictionary[@"image_url"];
        self.username = dictionary[@"username"];
        self.displayName = dictionary[@"display_name"];
    }
    return self;
}

- (NSMutableDictionary * __nonnull)encodeToDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    if (self.id) {
        dictionary[@"id"] = self.id;
    }
    if (self.imageUrl) {
        dictionary[@"image_url"] = self.imageUrl;
    }
    if (self.username) {
        dictionary[@"username"] = self.username;
    }
    if (self.displayName) {
        dictionary[@"display_name"] = self.displayName;
    }
    return dictionary;

}

@end
