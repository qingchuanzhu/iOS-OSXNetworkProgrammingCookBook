//
//  NetworkAddrModel.h
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 2/24/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkAddrModel : NSObject

@property (nonatomic, strong) NSString *interfaceName;
@property (nonatomic, strong) NSString *addressString;
@property (nonatomic, strong) NSString *maskString;
@property (nonatomic, strong) NSString *gatewayString;

@end
