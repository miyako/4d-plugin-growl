#import <Cocoa/Cocoa.h>

#import "4DPluginAPI.h"

@interface PAListener : NSObject {
	NSString *listenerMethodName;	
	NSNumber *listenerMethodId;	
	NSNumber *listenerProcessNumber;
	NSString *notificationType;	
	BOOL shouldTerminate;
	BOOL locked;		
}

- (id)initWithMethodName:(NSString *)methodName methodId:(NSNumber *)methodId processNumber:(NSNumber *)processNumber;

- (BOOL)shouldTerminate;
- (void)terminate;

- (BOOL)lock;
- (void)unlock;

@property (nonatomic, retain) NSString *listenerMethodName;
@property (nonatomic, retain) NSNumber *listenerMethodId;
@property (nonatomic, retain) NSNumber *listenerProcessNumber;

@property (nonatomic, retain) NSString *notificationType;

@end

int PA_NewProcess(void* procPtr, int stackSize, NSString *name);
PA_Unistring PA_setUnistringVariable(PA_Variable *v, NSString *s);
