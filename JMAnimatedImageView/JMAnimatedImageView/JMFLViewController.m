//
//  JMFLViewController.m
//  JMAnimatedImageView
//
//  Created by jerome morissard on 21/08/14.
//  Copyright (c) 2014 jerome morissard. All rights reserved.
//

#import "JMFLViewController.h"
#import "JMAnimatedGifImageView.h"

@interface JMFLViewController ()
@property (weak, nonatomic) IBOutlet JMAnimatedGifImageView *carImageView1;
@property (weak, nonatomic) IBOutlet JMAnimatedGifImageView *carImageView2;
@property (weak, nonatomic) IBOutlet JMAnimatedGifImageView *carImageView3;
@end

@implementation JMFLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"3 GIF, 3 animations ...";
    /*
    JMDemoGIFAutomaticAnimationUsingImageViewImageAndSystemCache,
    JMDemoGIFInteractiveAnimationUsingImageViewImageAndSystemCache,
    JMDemoGIFMultipleAnimationUsingImageViewImageAndSystemCache
    */
    
    if (self.demoExemple == JMDemoGIFAutomaticAnimationUsingImageViewImageLowMemoryPressure) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"rock" withExtension:@"gif"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.carImageView1.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView1 reloadAnimationImagesFromGifData:data];
        self.carImageView1.animationType = JMAnimatedImageViewAnimationTypeAutomaticLinearWithoutTransition;
        self.carImageView1.animationDuration = 3;
        [self.carImageView1 startAnimating];
        
        url = [[NSBundle mainBundle] URLForResource:@"Rotating_earth" withExtension:@"gif"];
        data = [NSData dataWithContentsOfURL:url];
        self.carImageView2.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView2 reloadAnimationImagesFromGifData:data];
        self.carImageView2.animationType = JMAnimatedImageViewAnimationTypeAutomaticLinearWithoutTransition;
        self.carImageView2.animationDuration = 3;
        [self.carImageView2 startAnimating];
        
        url = [[NSBundle mainBundle] URLForResource:@"nyan" withExtension:@"gif"];
        data = [NSData dataWithContentsOfURL:url];
        self.carImageView3.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView3 reloadAnimationImagesFromGifData:data];
        self.carImageView3.animationType = JMAnimatedImageViewAnimationTypeAutomaticLinearWithoutTransition;
        [self.carImageView3 startAnimating];
        
    } else if (self.demoExemple == JMDemoGIFInteractiveAnimationUsingImageViewImageLowMemoryPressure) {
        self.carImageView1.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView1 reloadAnimationImagesFromGifNamed:@"rock"];
        self.carImageView1.animationType = JMAnimatedImageViewAnimationTypeInteractive;
        [self.carImageView1 setInteractiveAnimation:YES];

        self.carImageView2.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView2 reloadAnimationImagesFromGifNamed:@"Rotating_earth"];
        self.carImageView2.animationType = JMAnimatedImageViewAnimationTypeInteractive;
        [self.carImageView2 setInteractiveAnimation:YES];

        self.carImageView3.memoryManagementOption = JMAnimatedImageViewMemoryLoadImageLowMemoryUsage;
        [self.carImageView3 reloadAnimationImagesFromGifNamed:@"nyan"];
        self.carImageView3.animationType = JMAnimatedImageViewAnimationTypeInteractive;
        [self.carImageView3 setInteractiveAnimation:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    JMAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.ramVc.view removeFromSuperview];
    
    [self.view addSubview:appDelegate.ramVc.view];
    [appDelegate.ramVc startRefreshingMemoryUsage];
}

@end
