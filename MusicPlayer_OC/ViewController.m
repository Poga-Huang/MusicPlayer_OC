//
//  ViewController.m
//  MusicPlayer_OC
//
//  Created by 黃柏嘉 on 2022/4/6.
//

#import "ViewController.h"
#import "MusicInfoTableViewCell.h"
#import "MusicPlayerViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *AllMusic;
-(void)passDataToNextPage:(NSInteger)index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _AllMusic = [[NSMutableArray alloc] initWithObjects:
                 [NSArray arrayWithObjects:@"韋禮安",@"如果可以", nil],
                 [NSArray arrayWithObjects:@"周興哲",@"如果能幸福", nil],
                 [NSArray arrayWithObjects:@"謝和弦",@"備胎", nil],
                 [NSArray arrayWithObjects:@"八三夭",@"想見你想見你想見你", nil],
                 [NSArray arrayWithObjects:@"陳勢安",@"好愛好散", nil], nil];
    
    self.navigationItem.title = @"音樂列表";
}

#pragma mark Action
- (IBAction)playMusic:(UIButton *)sender {
    [self passDataToNextPage:sender.tag];
}

#pragma mark private Method
-(void)passDataToNextPage:(NSInteger)index{
    
    static NSString *musicPlayerNibName = @"MusicPlayerViewController";
    MusicPlayerViewController *musicPlayerVC = [[MusicPlayerViewController alloc] initWithNibName:musicPlayerNibName bundle:nil];
    
    musicPlayerVC.navigationItem.title = @"音樂播放器";
    musicPlayerVC.musicData = _AllMusic;
    musicPlayerVC.currentMusicIndex = index;
    [self.navigationController pushViewController:musicPlayerVC animated:YES];
}

#pragma mark TableViewDtaSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _AllMusic.count ;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *cellID = @"songInfo";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    MusicInfoTableViewCell *musicInfoCell = (MusicInfoTableViewCell *)cell;
    musicInfoCell.musicCoverImageView.image = [UIImage imageNamed:_AllMusic[indexPath.row][1]];
    musicInfoCell.musicNameLabel.text = _AllMusic[indexPath.row][1];
    musicInfoCell.musicPlayButton.tag = indexPath.row;
        
    return musicInfoCell;
}

#pragma mark TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self passDataToNextPage:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

@end
