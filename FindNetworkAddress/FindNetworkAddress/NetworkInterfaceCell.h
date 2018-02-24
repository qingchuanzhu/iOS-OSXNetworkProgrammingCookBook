//
//  NetworkInterfaceCell.h
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 2/24/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkInterfaceCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *maskLabel;
@property (strong, nonatomic) IBOutlet UILabel *gatewayLabel;
@end
