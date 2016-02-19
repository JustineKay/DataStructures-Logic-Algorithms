//
//  SwipeViewController.m
//  2016-02-18_iOS-Review
//
//  Created by Justine Gartner on 2/18/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self setUpGestureRecognizers];
}


-(void)setUpGestureRecognizers
{
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *rightSwipe =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *downSwipe =[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
    [self.view addGestureRecognizer:downSwipe];
    
    
}

-(void)handleSwipe: (UISwipeGestureRecognizer *)gesture
{
    
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            
            self.view.backgroundColor = [UIColor darkGrayColor];
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            
            self.view.backgroundColor = [UIColor redColor];
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
            
        default:
            
            return;
    }
    
}
@end
