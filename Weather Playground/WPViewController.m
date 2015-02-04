//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WPWeatherController.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *weatherMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTempLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    self.imageView.alpha = 1;
    self.imageView.frame = self.view.frame;
    [self.view insertSubview:self.imageView belowSubview:self.textField
     ];

    self.location.text = @"";
    self.weatherMainLabel.text = @"";
    self.weatherDescriptionLabel.text = @"";
    self.weatherTempLabel.text = @"";

}
- (IBAction)search:(id)sender {
    
    [[WPWeatherController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:^(WPWeather *weather) {
        self.location.text = weather.locationName;
        self.weatherMainLabel.text = weather.weatherMain;
        self.weatherDescriptionLabel.text = weather.weatherDescription;
        self.weatherTempLabel.text = [NSString stringWithFormat:@"%@",weather.weatherTemp];
        NSString *myURL = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png",weather.weatherIcon];
        self.icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:myURL]]];
        self.title = self.location.text;
        self.imageView.alpha = 0.9;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
