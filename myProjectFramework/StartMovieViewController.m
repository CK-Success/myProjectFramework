//
//  StartMovieViewController.m
//  myProjectFramework
//
//  Created by NewBest_RD on 2017/7/28.
//  Copyright © 2017年 Jerry. All rights reserved.
//

#import "StartMovieViewController.h"
#import "RootTabBarController.h"

#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface StartMovieViewController ()

@property (strong, nonatomic) MPMoviePlayerController *player;;

@end

@implementation StartMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setBackGroundImage];
    [self SetupVideoPlayer];
    
}

-(void)setBackGroundImage{
    
    UIImageView * backImageview=[[UIImageView alloc]initWithFrame:self.view.bounds];
    backImageview.image=[UIImage imageNamed:@"qidong-1"];
    [self.view addSubview:backImageview];
    
}

- (void)SetupVideoPlayer
{
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:_movieURL];
    [self.view addSubview:self.player.view];
    self.player.shouldAutoplay = YES;//循环播放
    [self.player setControlStyle:MPMovieControlStyleNone];
    self.player.repeatMode = MPMovieRepeatModeOne;
    [self.player.view setFrame:[UIScreen mainScreen].bounds];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    
    [self setupLoginView];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(24, [UIScreen mainScreen].bounds.size.height - 32 - 48, [UIScreen mainScreen].bounds.size.width - 48, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    enterMainButton.alpha = 0;
    [self.player.view addSubview:enterMainButton];
    
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [UIView animateWithDuration:3.0 animations:^{
        enterMainButton.alpha = 1.0;
    }];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.player playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.player play];
    }
}


- (void)enterMainAction:(UIButton *)btn {
    NSLog(@"进入应用");
    
    [self.player stop];
    
    RootTabBarController *rootTabCtrl = [[RootTabBarController alloc]init];
    self.view.window.rootViewController = rootTabCtrl;
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
