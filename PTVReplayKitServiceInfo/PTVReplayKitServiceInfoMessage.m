//
// Created by John Boiles on 11/7/16.
// Copyright (c) 2016 Periscope. All rights reserved.
//

#import "PTVReplayKitServiceInfoMessage.h"
#import "PTVReplayKitServiceInfoMessageChat.h"
#import "PTVReplayKitServiceInfoMessageHeart.h"
#import "PTVReplayKitServiceInfoMessageJoin.h"
#import "PTVReplayKitServiceInfoMessageShare.h"
#import "PTVReplayKitServiceInfoMessageScreenshot.h"
#import "PTVReplayKitServiceInfoMessageViewerCount.h"

@interface PTVReplayKitServiceInfoMessage ()
@property (nonatomic) NSString *id;
@end

@implementation PTVReplayKitServiceInfoMessage

+ (NSString *)type
{
    NSAssert(NO, @"Subclasses should implement type");
    return @"";
}

+ (instancetype)newWithDictionary:(NSDictionary *)dictionary
{
    if (!dictionary) {
        return nil;
    }

    NSArray *supportedMessageClasses = @[PTVReplayKitServiceInfoMessageChat.class, PTVReplayKitServiceInfoMessageHeart.class, PTVReplayKitServiceInfoMessageJoin.class, PTVReplayKitServiceInfoMessageShare.class, PTVReplayKitServiceInfoMessageScreenshot.class, PTVReplayKitServiceInfoMessageViewerCount.class];
    static NSMutableDictionary<NSString *, Class> *sTypeToClass = nil;
    if (!sTypeToClass) {
        sTypeToClass = [[NSMutableDictionary alloc] initWithCapacity:supportedMessageClasses.count];
        for (Class messageClass in supportedMessageClasses) {
            sTypeToClass[messageClass.type] = messageClass;
        }
    }

    NSString *type = dictionary[@"type"];
    if (!type || !sTypeToClass[type]) {
        // Unsupported type
        return nil;
    }

    Class messageClass = sTypeToClass[type];
    return [(__kindof PTVReplayKitServiceInfoMessage *)[messageClass alloc] initWithDictionary:dictionary];
}

+ (NSArray<__kindof PTVReplayKitServiceInfoMessage *> *)messagesWithDictionaries:(NSArray<NSDictionary *> *)dictionaries
{
    if (!dictionaries) {
        return nil;
    }
    NSMutableArray *messages = [[NSMutableArray alloc] initWithCapacity:[dictionaries count]];
    for (NSDictionary *dictionary in dictionaries) {
        __kindof PTVReplayKitServiceInfoMessage *message = [self newWithDictionary:dictionary];
        if (message) {
            [messages addObject:message];
        }
    }
    return messages;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.id = dictionary[@"id"];
    }
    return self;
}

- (NSMutableDictionary *)encodeToDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    dictionary[@"type"] = [self.class type];
    if (self.id) {
        dictionary[@"id"] = self.id;
    }
    return dictionary;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    if (!hexString) {
        return nil;
    }
    NSUInteger rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    // bypass '#' character
    [scanner setScanLocation:1];
    [scanner scanHexInt:(unsigned *)&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/(CGFloat)255.0 green:((rgbValue & 0xFF00) >> 8)/(CGFloat)255.0 blue:(rgbValue & 0xFF)/(CGFloat)255.0 alpha:1.0];
}

+ (NSString *)hexStringFromColor:(UIColor *)color
{
    if (!color) {
        return nil;
    }
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString = [NSString stringWithFormat:@"#%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

@end
