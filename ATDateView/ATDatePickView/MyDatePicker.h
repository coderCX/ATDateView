

#import <UIKit/UIKit.h>
#import "UUDatePicker.h"

typedef void(^ DatePicker)(NSString *);

@interface MyDatePicker : UIView<UUDatePickerDelegate>{
	UIView 			*_ChoseView;
	NSString		*date_str;
}

@property (nonatomic, strong) DatePicker MyDatePicker;

+ (void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur;

@end
