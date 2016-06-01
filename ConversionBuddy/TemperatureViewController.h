//
//  FirstViewController.h
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *temperatureOutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *temperatureInputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitsSegmentControl;

- (IBAction)temperatureConvertButton:(id)sender;

@end

