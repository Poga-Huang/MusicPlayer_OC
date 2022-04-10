//
//  MusicInfoTableViewCell.h
//  MusicPlayer_OC
//
//  Created by 黃柏嘉 on 2022/4/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *musicCoverImageView;
@property (weak, nonatomic) IBOutlet UILabel *musicNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *musicPlayButton;


@end

NS_ASSUME_NONNULL_END
