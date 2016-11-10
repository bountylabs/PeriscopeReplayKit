//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTVReplayKitServiceInfoMessage.h"

@class PTVReplayKitServiceInfoUser;

@interface PTVReplayKitServiceInfoMessageHeart : PTVReplayKitServiceInfoMessage

//! User sending the heart
@property (readonly, nonatomic, nullable) PTVReplayKitServiceInfoUser *user;
//! Color with which to render the heart
@property (readonly, nonatomic, nullable) UIColor *color;

@end
