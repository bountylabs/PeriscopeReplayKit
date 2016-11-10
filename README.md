# Periscope iOS ReplayKit

Classes for parsing Periscope's iOS ReplayKit Streaming metadata (chats, hearts, joins, etc). Data is passed from Periscope's ReplayKit extension to your app via the `serviceInfo` dictionary in the `broadcastController:didUpdateServiceInfo:` method.

## Usage

Include the contents of the `PTVReplayKitServiceInfo` directory in your project. Then implement the `broadcastController:didUpdateServiceInfo:` method (from the `RPBroadcastControllerDelegate` protocol) similar to the following:

```objc
- (void)broadcastController:(RPBroadcastController *)broadcastController didUpdateServiceInfo:(NSDictionary <NSString *, NSObject <NSCoding> *> *)serviceInfo {
   NSString *format = (NSString *)serviceInfo[@"format"];
   if (format && [format isEqualToString:@"periscope/v1"]) {
       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           PTVReplayKitServiceInfo *periscopeServiceInfo = [[PTVReplayKitServiceInfo alloc] initWithDictionary:serviceInfo];
           for (__kindof PTVReplayKitServiceInfoMessage *message in periscopeServiceInfo.messages) {
               if ([message isKindOfClass:PTVReplayKitServiceInfoMessageChat.class]) {
                   PTVReplayKitServiceInfoMessageChat *chat = message;
                   NSLog(@"Got chat message %@ from %@ with color %@", chat.text, chat.user.username, chat.color);
               } else if ([message isKindOfClass:PTVReplayKitServiceInfoMessageHeart.class]) {
                   PTVReplayKitServiceInfoMessageHeart *heart = message;
                   NSLog(@"Got heart from %@ with color %@", heart.user.username, heart.color);
               } else if ([message isKindOfClass:PTVReplayKitServiceInfoMessageJoin.class]) {
                   PTVReplayKitServiceInfoMessageJoin *join = message;
                   NSLog(@"%@ joined with color %@", join.user.username, join.color);
               } else if ([message isKindOfClass:PTVReplayKitServiceInfoMessageScreenshot.class]) {
                   PTVReplayKitServiceInfoMessageScreenshot *screenshot = message;
                   NSLog(@"%@ took screenshot with color %@", screenshot.user.username, screenshot.color);
               } else if ([message isKindOfClass:PTVReplayKitServiceInfoMessageShare.class]) {
                   PTVReplayKitServiceInfoMessageShare *share = message;
                   NSLog(@"%@ shared on %@ with color %@", share.user.username, share.service, share.color);
               } else if ([message isKindOfClass:PTVReplayKitServiceInfoMessageViewerCount.class]) {
                   PTVReplayKitServiceInfoMessageViewerCount *count = message;
                   NSLog(@"Viewer count changed to %ld", (long int)count.viewerCount);
               }
           }
       });
   }
}
```
