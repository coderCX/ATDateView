

#import "MyDatePicker.h"
#import "UIImage+Fit.h"
//#import "Function.h"
//获取设备宽度
#define ATGetDeviceWidth ([UIScreen mainScreen].bounds.size.width)

//获取设备高度
#define ATGetDeviceHeight ([UIScreen mainScreen].bounds.size.height)

@implementation MyDatePicker

- (id)initWithFrame:(CGRect)frame

{
	
	self = [super initWithFrame:frame];
	
	if (self) {
		UIColor *colorYellow = [UIColor colorWithRed:252/255.0 green:148/255.0 blue:39/255.0 alpha:1] ;
		self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
		_ChoseView = [[UIView alloc] initWithFrame:CGRectMake(10, (self.bounds.size.height-280)/2, self.bounds.size.width-20, 280)];
//        [_ChoseView.layer setBorderWidth:1.0];
//        [_ChoseView.layer setBorderColor:[colorYellow CGColor]];
		[self addSubview:_ChoseView];
		
		NSDate *senddate=[NSDate date];
		NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
		[dateformatter setDateFormat:@"MM-dd"];
		
		NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
		NSDateComponents *comps = [[NSDateComponents alloc] init];
		NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
		NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
		comps = [calendar components:unitFlags fromDate:senddate];
        NSInteger year =  [comps year];
		NSInteger month = [comps month];
		NSInteger day = [comps day];

#warning 此处可以更改 控件日期显示的格式
		date_str = [NSString stringWithFormat:@"%ld-%ld-%ld",year,(long)month,day];
		
		UUDatePicker *datePicker = [[UUDatePicker alloc]initWithframe:CGRectMake(0, 35, _ChoseView.bounds.size.width, 200)
														  PickerStyle:1
														  didSelected:^(NSString *year,
																		NSString *month,
																		NSString *day,
																		NSString *hour,
																		NSString *minute,
																		NSString *weekDay) {
                                                              if ([year intValue]<10) {
                                                                  year =[NSString stringWithFormat:@"%d",[month intValue]];
                                                              }
//															  if ([month intValue]<10) {
//																  month = [NSString stringWithFormat:@"%d",[month intValue]];
//															  }
//															  if ([day intValue]<10) {
//																  day = [NSString stringWithFormat:@"%d",[day intValue]];
//															  }
															  date_str = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
														  }];
		
		[_ChoseView addSubview:datePicker];
		
		UILabel *title_label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _ChoseView.frame.size.width, 35)];
		title_label.text = @"选择生日";
		title_label.textAlignment = NSTextAlignmentCenter;
        title_label.backgroundColor =[UIColor whiteColor];
		 title_label.textColor = [UIColor lightGrayColor];
		title_label.font = [UIFont systemFontOfSize:17];
		[_ChoseView addSubview:title_label];
        
        UIButton *OKBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [OKBtn setBackgroundColor:[UIColor clearColor]];
        [OKBtn addTarget:self action:@selector(OKBtnFunc) forControlEvents:UIControlEventTouchUpInside];
        [OKBtn setTitle:@"确  定" forState:UIControlStateNormal];
        [OKBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        OKBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [OKBtn setFrame:CGRectMake(0
                                   , CGRectGetMaxY(datePicker.frame)
                                   ,ATGetDeviceWidth-20,40)];
        [OKBtn setBackgroundImage:[UIImage imageWithColor:colorYellow] forState:UIControlStateNormal];
        OKBtn.backgroundColor = [UIColor whiteColor];
        [_ChoseView addSubview:OKBtn];
		
	}
	
	return self;
}


- (void)OKBtnFunc{
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-M-dd"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    if ([date_str isEqualToString:locationString]) {
        [dateformatter setDateFormat:@"YYYY-MM-dd"];
        NSString *locationString=[dateformatter stringFromDate:senddate];
        date_str =locationString;
    }
	self.MyDatePicker(date_str);
  [self removeFromSuperview];
}


#pragma mark - UUDatePicker's delegate
- (void)uuDatePicker:(UUDatePicker *)datePicker
				year:(NSString *)year
			   month:(NSString *)month
				 day:(NSString *)day
				hour:(NSString *)hour
			  minute:(NSString *)minute
			 weekDay:(NSString *)weekDay
{
}

+ (void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [changeOutView.layer addAnimation:animation forKey:nil];
}

@end
