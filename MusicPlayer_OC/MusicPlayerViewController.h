//
//  MusicPlayerViewController.h
//  MusicPlayer_OC
//
//  Created by 黃柏嘉 on 2022/4/6.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface MusicPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *musicCoverImageView;
@property (weak, nonatomic) IBOutlet UILabel *musicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singerLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (nonatomic,weak) NSString *musicName;
@property (nonatomic,weak) NSString *singer;

//接受傳遞的資料
@property(nonatomic,strong)NSMutableArray *musicData;
@property(nonatomic,assign)NSInteger currentMusicIndex;

@end

NS_ASSUME_NONNULL_END
