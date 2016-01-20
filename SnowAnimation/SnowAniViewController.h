//
//  SnowAniViewController.h
//  SnowAnimation
//
//  Created by YUGWANGYONG on 1/20/16.
//  Copyright © 2016 yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowAniViewController : UIViewController {
    UIImageView *SnowImageView; // 움직이는 배경 이미지 뷰
    UIImage *snowImage; // 눈 이미지
}

- (void) StartBackgroundAnimation:(float) Duration; // 움직이는 배경 애니메이션 시작
- (void) StartSnowAnimation:(float) Duration; // 눈 에니메이션 시작
- (void) animationTimerHandler:(NSTimer*)theTimer; // 타이머 이벤트 핸들러

@end
