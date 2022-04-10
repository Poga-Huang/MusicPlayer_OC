//
//  MusicPlayerViewController.m
//  MusicPlayer_OC
//
//  Created by 黃柏嘉 on 2022/4/6.
//

#import "MusicPlayerViewController.h"


@interface MusicPlayerViewController ()

@property (nonatomic,strong) AVPlayer *player;
@property (nonatomic,strong) NSURL *url;

@property (nonatomic,assign) BOOL isPlaying;

-(void)initMusicPlayer;
-(void)updateUI;
-(void)setMusicVolume:(float)volumeValue;

@end

@implementation MusicPlayerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _musicCoverImageView.layer.cornerRadius = 15;
    
    //init
    if (_musicData != nil){
        [self initMusicPlayer];
    }
    
}

#pragma mark property

-(void)setIsPlaying:(BOOL)isPlaying{
    if (!isPlaying){
        [_playButton setImage:[UIImage imageNamed:@"play.filled"] forState:UIControlStateNormal];
        [_player pause];
        _isPlaying = false;
    }
    else{
        [_playButton setImage:[UIImage imageNamed:@"pause.filled"] forState:UIControlStateNormal];
        [_player play];
        _isPlaying = true;
    }
}

#pragma mark private Method

//初始化MusicPlayer
-(void)initMusicPlayer{
    [self updateUI];
    [self setPlayer:_player];
    [self setMusicVolume:_volumeSlider.value];
    self.isPlaying = true;
}

//更新畫面上UI顯示的音樂資訊
-(void)updateUI{
    _singer = _musicData[_currentMusicIndex][0];
    _musicName = _musicData[_currentMusicIndex][1];
    _musicCoverImageView.image = [UIImage imageNamed:_musicName];
    _musicNameLabel.text = _musicName;
    _singerLabel.text = _singer;
}

//設定AVPlayer
-(void)setPlayer:(AVPlayer *)player{
    _url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:_musicName ofType:@"mp3"] ];
    _player = [[AVPlayer alloc]initWithURL:_url] ;
}

//設定音量
-(void)setMusicVolume:(float)volumeValue{
    _player.volume = volumeValue;
    _volumeSlider.value = volumeValue;
}


#pragma mark Action

//上一首
- (IBAction)previousSong:(UIButton *)sender {
    if (_currentMusicIndex == 0){
        _currentMusicIndex = 4;
        
    }
    else{
        _currentMusicIndex -= 1;
    }
    [self initMusicPlayer];
}

//播放或暫停
- (IBAction)switchPlayOrPause:(UIButton *)sender {
    if (!_isPlaying){
        self.isPlaying = true;
    }else{
        self.isPlaying = false;
    }
}
//下一首
- (IBAction)nextButton:(UIButton *)sender {
    if (_currentMusicIndex == 4){
        _currentMusicIndex = 0;
        
    }
    else{
        _currentMusicIndex += 1;
    }
    [self initMusicPlayer];
}

//靜音
- (IBAction)quiet:(UIButton *)sender {
    [self setMusicVolume:0];
}
//調整音量
- (IBAction)adjustVolume:(UISlider *)sender {
    [self setMusicVolume:sender.value];;
}
//大聲
- (IBAction)loud:(UIButton *)sender {
    [self setMusicVolume:1];
}


@end
