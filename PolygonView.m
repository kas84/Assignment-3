#import "PolygonView.h"
@implementation PolygonView

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)sides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / sides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < sides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
} 

- (void) drawRect:(CGRect)rect{
	CGContextRef context = UIGraphicsGetCurrentContext();
	[[UIColor grayColor]set];
	UIRectFill([self bounds]);
	NSArray *points=[self pointsForPolygonInRect:[self bounds] numberOfSides:polygon.numberOfSides];
	BOOL firstOne=YES;
	CGContextBeginPath(context);
	for (int i=0; i<[points count]; ++i){
		NSValue *value= [points objectAtIndex:i];
		CGPoint point = [value CGPointValue];
		if (firstOne){
			CGContextMoveToPoint(context, point.x, point.y);
			firstOne=NO;
		}
		else {
			CGContextAddLineToPoint(context, point.x, point.y);
		}
	}
	CGContextClosePath(context);
	[name setText:polygon.name];
	[name setTextAlignment:UITextAlignmentCenter];
	[[UIColor blackColor] setStroke];
	[[UIColor whiteColor] setFill];
	CGContextDrawPath(context, kCGPathFillStroke);
	
}

@end
