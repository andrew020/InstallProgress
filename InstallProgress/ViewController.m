//
//  ViewController.m
//  InstallProgress
//
//  Created by star on 14/12/21.
//  Copyright (c) 2014年 Star. All rights reserved.
//

#import "ViewController.h"

const NSString *kBundleID = @"kBundleID";
const NSString *kVersion = @"kVersion";
const NSString *kPlistURL = @"kPlistURL";

const NSString *kInstall = @"Install";
const NSString *kUpdate = @"Update";
const NSString *kOpen = @"kOpen";

@interface ViewController () {
    NSArray *exitedDatas;
}

@property (strong, nonatomic) IBOutlet UITableView *installingTB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    exitedDatas = @[
                    @{
                        kBundleID : @"",
                        kVersion : @"",
                        kPlistURL : @"",
                        }
                    ];
}

#pragma mark- UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return exitedDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"installingID"];
    
    UILabel *bunldIDLB  = (UILabel *)[cell.contentView viewWithTag:10000];
    UILabel *progressLB = (UILabel *)[cell.contentView viewWithTag:10001];
    UILabel *statuLB    = (UILabel *)[cell.contentView viewWithTag:10002];
    
    bunldIDLB.text = [exitedDatas[indexPath.row] objectForKey:kBundleID];
    progressLB.text = @"0";
    statuLB.text = [kInstall copy];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
