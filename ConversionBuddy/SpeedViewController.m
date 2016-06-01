//
//  ThirdViewController.m
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "SpeedViewController.h"

@interface SpeedViewController ()

@end

/*
 
 @property (weak, nonatomic) IBOutlet UILabel *speedOutputLabel;
 @property (weak, nonatomic) IBOutlet UITextField *speedInputField;
 @property (weak, nonatomic) IBOutlet UISegmentedControl *unitSegmentedControl;
 - (IBAction)speedConvertButton:(id)sender;
 
 */

@implementation SpeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)speedConvertButton:(id)sender {
	NSString * enteredUnitType = [_unitSegmentedControl titleForSegmentAtIndex:_unitSegmentedControl.selectedSegmentIndex];
	
	if([enteredUnitType isEqualToString:@"KPH"]) {
		//convert from MPH to KPH
		
		_speedOutputLabel.text = [NSString stringWithFormat:@"%.2f", ([_speedInputField.text floatValue] * 1.60934)];
		_outputCommentLabel.text = @"Your speed in KPH is:";
	}
	else {
		//convert from KPH to MPH
		
		_speedOutputLabel.text = [NSString stringWithFormat:@"%.2f", ([_speedInputField.text floatValue] / 1.60934)];
		_outputCommentLabel.text = @"Your speed in MPH is:";
	}
}

@end
