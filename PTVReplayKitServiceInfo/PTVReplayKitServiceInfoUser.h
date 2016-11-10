//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTVReplayKitServiceInfoUser : NSObject

//! Unique ID for the user
@property (readonly, nonatomic, nullable) NSString *id;
//! User's profile image URL
@property (readonly, nonatomic, nullable) NSString *imageUrl;
//! Username
@property (readonly, nonatomic, nullable) NSString *username;
//! User's display name (typically real name)
@property (readonly, nonatomic, nullable) NSString *displayName;

+ (__nullable instancetype)newWithDictionary:(NSDictionary * __nullable)dictionary;

- (__nonnull instancetype)initWithDictionary:(NSDictionary * __nonnull)dictionary;

- (NSMutableDictionary * __nonnull)encodeToDictionary;

@end
