//
//  ViewController.m
//  CopyTrip
//
//  Created by admin on 16/3/21.
//  Copyright © 2016年 drmshow. All rights reserved.
//

#import "ViewController.h"
#import "TouristCityTableViewCell.h"

#define kCellHeight 160
#define kFactor     0.12

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) CGFloat offSetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.offSetY = 0;
    [self.tableView registerNib:[UINib nibWithNibName:@"TouristCityTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TouristCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *imageName = [NSString stringWithFormat:@"%td.jpg", indexPath.row % 4];
    cell.cityImageView.image = [UIImage imageNamed:imageName];
    [cell bringSubviewToFront:cell.cityImageView];
    cell.cityLabel.text = [NSString stringWithFormat:@"城市%td", indexPath.row];
    return cell;
}

#pragma mark -UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeight;
}

#pragma mark -UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetY = scrollView.contentOffset.y;
    CGFloat minus = offSetY - self.offSetY;
    self.offSetY = offSetY;
    NSArray *cells = [self.tableView visibleCells];
    for (TouristCityTableViewCell *cell in cells) {
        CGRect r = cell.cityImageView.frame;
        CGFloat y = r.origin.y;
        CGFloat w = r.size.width;
        CGFloat h = r.size.height;
        if ((-y *2 + minus) >= h) {
            minus = h + 2*y;
        }
        cell.cityImageView.frame = CGRectMake(0, y - minus *kFactor, w, h);
    }
}

@end
