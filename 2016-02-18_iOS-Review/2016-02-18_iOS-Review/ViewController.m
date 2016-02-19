//
//  ViewController.m
//  2016-02-18_iOS-Review
//
//  Created by Justine Gartner on 2/18/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import "ViewController.h"
#import "APIManager.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger timerCount;
@property (nonatomic) NSInteger timeMin;
@property (nonatomic) NSInteger timeSec;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.mapView.showsUserLocation = YES;
    
    [self setupTimer];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    //here in viewDidAppear because in viewDidLoad it would not have appeared
    [self.locationManager requestWhenInUseAuthorization];
    
}

-(void)setupTimer
{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.timeMin = 0;
    self.timeSec = 0;
    //self.timerCount = 10;
    //[timer fire];
    
}

-(void)timerFired:(NSTimer *)timer
{
//    if (self.timerCount == 0) {
//        
//        [timer invalidate];
//        self.timerCount = 10;
//        
//    }else {
//        
//        self.timerCount --;
//        NSLog(@"Timer Fired");
//    }
    
    self.timeSec++;
    if (self.timeSec == 60)
    {
        self.timeSec = 0;
        self.timeMin++;
    }

    NSLog(@"Timer Fired");
    
    NSString * timeNow = [NSString stringWithFormat:@"%02ld:%02ld",self.timeMin,self.timeSec];
    self.timerLabel.text = timeNow;
    
    
    
    [APIManager getLatestISSLocationWithCompletionHandler:^(CLLocationCoordinate2D coords) {
        
        NSLog(@"lat: %f, lng: %f", coords.latitude, coords.longitude);
        MKCoordinateSpan span = MKCoordinateSpanMake(50, 50);
        MKCoordinateRegion region = MKCoordinateRegionMake(coords, span);
        [self.mapView setRegion:region animated:YES];
    }];
    
}

@end
