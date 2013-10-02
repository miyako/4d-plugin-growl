#import <Cocoa/Cocoa.h>
#import "PAListener.h"
#import <Growl/Growl.h>

@interface GrowlListener : PAListener <GrowlApplicationBridgeDelegate>
{
	NSString *appName;
	NSString *notificationName;
}

@property (nonatomic, retain) NSString *appName;
@property (nonatomic, retain) NSString *notificationName;

@end
