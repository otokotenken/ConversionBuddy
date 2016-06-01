//
//  FourthViewController.h
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timeOutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *timeInputField;
@property (weak, nonatomic) IBOutlet UIPickerView *timePickerView;
- (IBAction)timeConvertButton:(id)sender;

@end
