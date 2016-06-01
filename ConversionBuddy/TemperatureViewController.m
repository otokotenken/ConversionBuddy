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
CLLocationManager *locationManager;
CLLocation *currentLocation;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CurrentLocationIdentifier]; // call this method
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------ Current Location Address-----
-(void)CurrentLocationIdentifier
{
    //---- For getting current gps location
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    //------
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [locationManager stopUpdatingLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
     {
         CLPlacemark *placemark;
         NSString *locatedAt;
         NSString *Address;
         NSString *Area;
         NSString *Country;
         NSString *CountryArea;
         if (!(error))
         {
             placemark = [placemarks objectAtIndex:0];
             NSLog(@"\nCurrent Location Detected\n");
             NSLog(@"placemark %@",placemark);
             locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
             Address = [[NSString alloc]initWithString:locatedAt];
             Area = [[NSString alloc]initWithString:placemark.locality];
             Country = [[NSString alloc]initWithString:placemark.country];
             CountryArea = [NSString stringWithFormat:@"%@, %@", Area,Country];
             NSLog(@"%@",CountryArea);
         }
         else
         {
             NSLog(@"Geocode failed with error %@", error);
             NSLog(@"\nCurrent Location Not Detected\n");
             //return;
             CountryArea = NULL;
         }
         /*---- For more results
          placemark.region);
          placemark.country);
          placemark.locality);
          placemark.name);
          placemark.ocean);
          placemark.postalCode);
          placemark.subLocality);
          placemark.location);
          ------*/
     }];
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
