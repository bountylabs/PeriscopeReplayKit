//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTVReplayKitServiceInfoMessage.h"

@class PTVReplayKitServiceInfoUser;

@interface PTVReplayKitServiceInfoMessageShare : PTVReplayKitServiceInfoMessage

//! Service the user shared to (e.g. 'periscope' or 'twitter' or 'facebook' or 'twitter_retweet'
@property (readonly, nonatomic, nullable) NSString *service;
//! User sharing the broadcast
@property (readonly, nonatomic, nullable) PTVReplayKitServiceInfoUser *user;
//! Color associated with this message
@property (readonly, nonatomic, nullable) UIColor *color;

@end
