//
//  SecondViewController.h
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrencyViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currencyOutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *currencyInputField;
@property (weak, nonatomic) IBOutlet UIPickerView *currencyPickerView;

- (IBAction)currencyConvertButton:(id)sender;

@end

