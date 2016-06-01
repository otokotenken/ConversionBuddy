//
//  SecondViewController.m
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "CurrencyViewController.h"

@interface CurrencyViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation CurrencyViewController
NSArray *currencies;
double euro = 0.89;
double canadian = 1.31;
double peso = 18.52;
double pounds = 0.69;
double rupees = 67.48;

- (void)viewDidLoad {
    [super viewDidLoad];
    currencies = [[NSArray alloc]initWithObjects:@"Euro", @"Canadian Dollar", @"Mexican Peso", @"British Pounds", @"India Rupees", nil];
    
    self.currencyPickerView.dataSource = self;
    self.currencyPickerView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *) pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return currencies.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return currencies[row];
}

- (IBAction)currencyConvertButton:(id)sender {
    NSInteger selectedConversion =[_currencyPickerView selectedRowInComponent:0];
    if (selectedConversion == 0){
        _currencyOutputLabel.text = [NSString stringWithFormat:@"%.2f Euros", [_currencyInputField.text floatValue] * euro];
    } else if (selectedConversion == 1){
        _currencyOutputLabel.text = [NSString stringWithFormat:@"%.2f Canadian Dollars", [_currencyInputField.text floatValue] * canadian];
    } else if (selectedConversion == 2) {
        _currencyOutputLabel.text = [NSString stringWithFormat:@"%.2f Pesos", [_currencyInputField.text floatValue] * peso];
    } else if (selectedConversion == 3){
        _currencyOutputLabel.text = [NSString stringWithFormat:@"%.2f Pounds", [_currencyInputField.text floatValue] * pounds];
    } else if (selectedConversion == 4){
        _currencyOutputLabel.text = [NSString stringWithFormat:@"%.2f Rupees", [_currencyInputField.text floatValue] * rupees];
    }
    
}


@end
