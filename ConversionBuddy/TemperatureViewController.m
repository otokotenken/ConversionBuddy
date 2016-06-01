//
//  FirstViewController.m
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@end

@implementation TemperatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)temperatureConvertButton:(id)sender {
        
        NSString * enteredUnitType = [_unitsSegmentControl titleForSegmentAtIndex:_unitsSegmentControl.selectedSegmentIndex];
    
        if([enteredUnitType isEqualToString:@"Fahranheit"]) {
            //convert from F to C
            //(50°F - 32) x .5556 = 10°C
            
            _temperatureOutputLabel.text = [NSString stringWithFormat:@"%.2f", (([_temperatureInputField.text floatValue] - 32) * 0.5556)];
        }
        else {
            //convert from C to F
            //30°C x 1.8 + 32 = 86°F
            
            _temperatureOutputLabel.text = [NSString stringWithFormat:@"%.2f", ([_temperatureInputField.text floatValue] * 1.8 + 32)];
    }
}
@end
