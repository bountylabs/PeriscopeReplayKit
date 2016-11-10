//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTVReplayKitServiceInfoMessage.h"

@interface PTVReplayKitServiceInfoMessageViewerCount : PTVReplayKitServiceInfoMessage

//! Number of viewers currently watching the broadcast live
@property (readonly, nonatomic) NSUInteger viewerCount;

@end
