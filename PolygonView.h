#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView: UIView {
	IBOutlet PolygonShape *polygon;
	IBOutlet UILabel *name;
}

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)sides;
- (void) drawRect:(CGRect)rect;
@end
