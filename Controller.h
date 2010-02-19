#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet UILabel *name;
    IBOutlet PolygonShape *polygon;
	IBOutlet PolygonView *polygonView;
	IBOutlet UISlider *slider;
	IBOutlet UISegmentedControl *linearOrDashed;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)segmentedChanged:(id)sender;
- (void) awakeFromNib;
- (void) updateInterface:(int)sides;
- (void) saveToUserDefaults:(int)sides;
- (int) retrieveFromUserDefaults;

@end
