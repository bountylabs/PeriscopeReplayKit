//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTVReplayKitServiceInfoMessage.h"

@class PTVReplayKitServiceInfoUser;

@interface PTVReplayKitServiceInfoMessageJoin : PTVReplayKitServiceInfoMessage

//! User that joined the broadcast
@property (readonly, nonatomic, nullable) PTVReplayKitServiceInfoUser *user;
//! Color associated with this user in this broadcast
@property (readonly, nonatomic, nullable) UIColor *color;

@end
