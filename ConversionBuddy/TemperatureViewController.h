//
//  FirstViewController.h
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TemperatureViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *temperatureOutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *temperatureInputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitsSegmentControl;
@property(nonatomic, readonly) UIAlertControllerStyle preferredStyle;

- (IBAction)temperatureConvertButton:(id)sender;

@end

