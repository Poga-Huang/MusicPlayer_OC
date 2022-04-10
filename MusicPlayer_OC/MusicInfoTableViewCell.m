//
//  MusicInfoTableViewCell.m
//  MusicPlayer_OC
//
//  Created by 黃柏嘉 on 2022/4/8.
//

#import "MusicInfoTableViewCell.h"

@implementation MusicInfoTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    _musicCoverImageView.layer.cornerRadius = 15;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
