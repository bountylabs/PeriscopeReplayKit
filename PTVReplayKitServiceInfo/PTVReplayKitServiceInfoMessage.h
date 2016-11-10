//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PTVReplayKitServiceInfoMessage : NSObject

//! Unique ID for the message
@property (readonly, nonatomic, nullable) NSString *id;
//! Message type (fixed for each subclass)
@property (readonly, class, nonatomic, nonnull) NSString *type;

//! Primarily for subclasses, shouldn't be called directly
- (instancetype __nonnull)initWithDictionary:(NSDictionary * __nonnull)dictionary;

- (NSMutableDictionary * __nonnull)encodeToDictionary;

+ (NSArray<__kindof PTVReplayKitServiceInfoMessage *> * __nullable)messagesWithDictionaries:(NSArray<NSDictionary *> * __nullable)dictionaries;

//! Used by subclasses for serializing/deserializing hex colors
+ (UIColor * __nullable)colorFromHexString:(NSString * __nullable)hexString;
+ (NSString *__nullable)hexStringFromColor:(UIColor * __nullable)color;

@end
