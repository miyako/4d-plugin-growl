#import "listener.h"

@implementation GrowlListener

@synthesize appName;
@synthesize notificationName;

- (id)initWithProcessNumber:(NSNumber *)processNumber{

	if(!(self = [super init]))return self;
	
	self.listenerProcessNumber = processNumber;

	return self;	
}

- (void) growlNotificationWasClicked:(id)clickContext{

	if([self lock]){
		
		self.notificationType = @"On Clicked";
		
		PA_UnfreezeProcess([self.listenerProcessNumber intValue]);
		
	}
}

- (void) growlNotificationTimedOut:(id)clickContext{

	if([self lock]){
		
		self.notificationType = @"On Timeout";	
		
		PA_UnfreezeProcess([self.listenerProcessNumber intValue]);	
		
	}
}

- (NSString *) applicationNameForGrowl{

	return appName;
	
}

- (NSDictionary *) registrationDictionaryForGrowl{
	
	NSArray *defaultNotifications = [NSArray arrayWithObject:notificationName];
	
	NSDictionary *regDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
																 appName, 
																 defaultNotifications, 
																 defaultNotifications, 
																 nil] 
														forKeys:[NSArray arrayWithObjects:
																 GROWL_APP_NAME, 
																 GROWL_NOTIFICATIONS_ALL, 
																 GROWL_NOTIFICATIONS_DEFAULT, 
																 nil]]; 
	return regDict;
}

@end