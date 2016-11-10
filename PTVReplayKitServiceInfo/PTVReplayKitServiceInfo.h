//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTVReplayKitServiceInfoMessage.h"

@interface PTVReplayKitServiceInfo : NSObject

@property (readonly, nullable) NSString *format;
@property (readonly, nullable) NSArray<__kindof PTVReplayKitServiceInfoMessage *> *messages;

- (instancetype __nonnull)initWithDictionary:(NSDictionary * __nonnull)dictionary;

@end
