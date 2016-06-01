//
//  ThirdViewController.h
//  ConversionBuddy
//
//  Created by DetroitLabs on 6/1/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *speedOutputLabel;
@property (weak, nonatomic) IBOutlet UITextField *speedInputField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *outputCommentLabel;
- (IBAction)speedConvertButton:(id)sender;

@end
