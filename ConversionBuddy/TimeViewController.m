//
//  FourthViewController.m
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "TimeViewController.h"
#import <UIKit/UIKit.h>

@interface TimeViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation TimeViewController

NSArray * timeZones;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	// Initialize Data
	timeZones = @[@"GMT (0)", @"EDT (-4)", @"IST (-9.5)"];
	
	// Connect data
	_timePickerView.dataSource = self;
	_timePickerView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}


// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return timeZones.count;
}


// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return timeZones[row];
}

// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	//NSLog(@"picker selection made: row - %zd, component - %zd", row, component);
}


- (IBAction)timeConvertButton:(id)sender {

	//NSLog(@"selected index for picker: %zd, value: %@", [_timePickerView selectedRowInComponent:0], timeZones[[_timePickerView selectedRowInComponent:0]]);
	
	//NSLog(@"selected time is: %@", [[_timePicker date] description]);
	
	NSInteger selectedTimeZone = [_timePickerView selectedRowInComponent:0];
	
	NSTimeZone *timeZone;
	NSString *timeZoneCode;
	
	if(selectedTimeZone == 0) {
		timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
		timeZoneCode = @"GMT";
	}
	else if (selectedTimeZone == 1) {
		timeZone = [NSTimeZone timeZoneWithName:@"EDT"];
		timeZoneCode = @"EDT";
	}
	else if (selectedTimeZone == 2) {
		timeZone = [NSTimeZone timeZoneWithName:@"IST"];
		timeZoneCode = @"IST";
	}
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setTimeZone:timeZone];
	[formatter setDateFormat:@"hh:mm a"];
	
	_timeOutputLabel.text = [formatter stringFromDate:[_timePicker date]];
	_outputCommentLabel.text = [NSString stringWithFormat: @"Your time in %@ is:", timeZoneCode];
}
@end
