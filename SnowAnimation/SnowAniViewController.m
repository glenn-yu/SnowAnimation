//
//  SnowAniViewController.m
//  SnowAnimation
//
//  Created by YUGWANGYONG on 1/20/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import "SnowAniViewController.h"

@interface SnowAniViewController ()

@end

@implementation SnowAniViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self StartBackgroundAnimation:5]; // 움직이는 배경 효과 애니메이션 시작(실행 시간 5초)
    [self StartSnowAnimation:0.25]; // 눈이 내리는 효과 애니메이션 시작(0.25초 주기)
}

- (void) StartBackgroundAnimation:(float)Duration {
    if(SnowImageView == nil) {
        SnowImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
        NSMutableArray *imageArray = [NSMutableArray array];
        for(int i=1;i<=46;i++)
            [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"snow-%d.tiff", i]]];
        SnowImageView.animationImages = imageArray;
    } else {
        [SnowImageView removeFromSuperview];
    }
    SnowImageView.animationDuration = Duration; // 애니메이션 길이
    SnowImageView.animationRepeatCount = 0; // 반복 횟수 지정
    [SnowImageView startAnimating]; // 애니메이션 시작
    [self.view addSubview:SnowImageView];
}

-(void) StartSnowAnimation:(float)Duration {// StartShowAnimation Method
    snowImage = [UIImage imageNamed:@"snow.png"]; // 눈 이미지 불러오기
    [NSTimer scheduledTimerWithTimeInterval:(0.3) target:self selector:@selector(animationTimerHandler:) userInfo: nil repeats:YES]; // 타이머 설정하기
}

-(void) animationTimerHandler:(NSTimer *)theTimer {
    UIImageView *snowView = [[UIImageView alloc] initWithImage:snowImage];
    
    int startX = round(random() % 320);
    int endX = round(random() % 320);
    double snowSpeed = 10 + (random() % 10) / 10.0;
    
    snowView.alpha = 0.9;
    snowView.frame = CGRectMake(startX, -20, 20, 20); // 시작지점
    
    [UIView beginAnimations:nil context:(__bridge void *)(snowView)]; // 애니메이션 블록 설정
    [UIView setAnimationDuration:snowSpeed]; // 애니메이션 속도
    
    snowView.frame = CGRectMake(endX, 568.0, 20, 20); // 최종 도착 지점
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationDelegate:self];
    [SnowImageView addSubview:snowView]; // 이미지 뷰 추가
    [UIView commitAnimations]; // 애니메이션 시작
}

-(void) animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{ // animationDidStop Method
    [(__bridge UIImageView *)context removeFromSuperview]; // 이미지 뷰 제거
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
