#import "Controller.h"
@implementation Controller
- (IBAction)decrease:(id)sender {
	[self updateInterface:polygon.numberOfSides-1];
	
}

- (IBAction)increase:(id)sender {
	[self updateInterface:polygon.numberOfSides+1];
}
- (void) awakeFromNib{
	int numSides = [self retrieveFromUserDefaults];
	polygon.maximumNumberOfSides=12;
	polygon.minimumNumberOfSides=3;
	slider.value=numSides;
	[self updateInterface:numSides];

}

-(void) updateInterface:(int)sides{
	polygon.numberOfSides=sides;
	numberOfSidesLabel.text=[NSString stringWithFormat:@"%d",sides];
	increaseButton.enabled = polygon.numberOfSides< polygon.maximumNumberOfSides?YES:NO;
	decreaseButton.enabled = polygon.numberOfSides> polygon.minimumNumberOfSides?YES:NO;
//	minimumSides.text = [NSString stringWithFormat:@"%d",polygon.minimumNumberOfSides];
//	maximumSides.text =[NSString stringWithFormat:@"%d",polygon.maximumNumberOfSides];
//	name.text=polygon.name;
//	angleInDegrees.text= [NSString stringWithFormat:@"%f",polygon.angleInDegrees];
	[self saveToUserDefaults:sides];
	[polygonView setNeedsDisplay];
	
}

-(void)saveToUserDefaults:(int)sides
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) {
		[standardUserDefaults setInteger:sides forKey:@"prefs"];
		[standardUserDefaults synchronize];
	}
}

-(int)retrieveFromUserDefaults
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	int val = 3;
	
	if (standardUserDefaults) 
		val = [standardUserDefaults integerForKey:@"prefs"];
	return val;
}
- (IBAction)sliderChanged:(id)sender{
	[self updateInterface:slider.value];
}
- (IBAction)segmentedChanged:(id)sender{
	[self updateInterface:slider.value];
}
@end
