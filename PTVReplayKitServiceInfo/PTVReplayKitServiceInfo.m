//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfo.h"

@interface PTVReplayKitServiceInfo ()
@property (nullable) NSString *format;
@property (nullable) NSArray<__kindof PTVReplayKitServiceInfoMessage *> *messages;
@end


@implementation PTVReplayKitServiceInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.format = dictionary[@"format"];
        self.messages = [PTVReplayKitServiceInfoMessage messagesWithDictionaries:dictionary[@"messages"]];
    }
    return self;
}

@end
