#import "PAListener.h"

@implementation PAListener

@synthesize listenerMethodName;
@synthesize listenerMethodId;
@synthesize listenerProcessNumber;

@synthesize notificationType;

- (id)initWithMethodName:(NSString *)methodName methodId:(NSNumber *)methodId processNumber:(NSNumber *)processNumber
{
	if(!(self = [super init]))return self;
	
	self.listenerMethodName = methodName;
	self.listenerMethodId = methodId;	
	self.listenerProcessNumber = processNumber;
	
	shouldTerminate = NO;
	locked = NO;
	
	return self;
}

- (BOOL)shouldTerminate
{
	return shouldTerminate;	
}

- (void)terminate
{
	locked = YES;
	shouldTerminate = YES;
	
	PA_UnfreezeProcess([self.listenerProcessNumber intValue]);		
}

- (void)unlock
{
	locked = NO;
}

- (BOOL)lock
{
	if(!locked){
		locked = YES;
		return YES;
	}else{
		return NO;
	}
	
}

@end

int PA_NewProcess(void* procPtr, int stackSize, NSString *name)
{
	C_TEXT t;
	t.setUTF16String(name);
	
	return PA_NewProcess(procPtr, stackSize, (PA_Unichar *)t.getUTF16StringPtr());	
}

PA_Unistring PA_setUnistringVariable(PA_Variable *v, NSString *s)
{
	C_TEXT t;
	t.setUTF16String(s);	
	PA_Unistring u = PA_CreateUnistring((PA_Unichar *)t.getUTF16StringPtr());
	PA_SetStringVariable(v, &u);
	return u;
}