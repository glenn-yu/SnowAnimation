//
//  ViewController.m
//  SnowAnimation
//
//  Created by YUGWANGYONG on 1/20/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import "ViewController.h"
#import "SnowAniViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize infoButton;

- (void)viewDidLoad { // viewDidLoad 메서드
    SnowAniViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SnowAniViewController"];
    
    //infoButton 뒤로 RecodViewController.view를 넣습니다.
    [self.view insertSubview:viewController.view belowSubview:infoButton];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
