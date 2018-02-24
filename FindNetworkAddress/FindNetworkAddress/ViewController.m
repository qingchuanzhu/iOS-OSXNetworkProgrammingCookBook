//
//  ViewController.m
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 2/23/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import "ViewController.h"
#import "NetworkInterfaceCell.h"
#import "NetworkAddressStore.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NetworkAddressStore *store;
@property (nonatomic, strong) NSArray<NetworkAddrModel *> *modelList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.store = [NetworkAddressStore new];
    self.modelList = [self.store listOfInterfaceToDisplay];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 0)];
    nameLable.text = (self.modelList[section]).interfaceName;
    [nameLable sizeToFit];
    return nameLable;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *headerView = [self tableView:tableView viewForHeaderInSection:section];
    return CGRectGetHeight(headerView.frame);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NetworkInterfaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressCell" forIndexPath:indexPath];
    [cell.addressLabel setText:(self.modelList[indexPath.section]).addressString];
    [cell.maskLabel setText:(self.modelList[indexPath.section]).maskString];
    [cell.gatewayLabel setText:(self.modelList[indexPath.section]).gatewayString];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
