//
//  NetworkAddressStore.h
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 2/24/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkAddrModel.h"

@interface NetworkAddressStore : NSObject

- (NSArray<NetworkAddrModel *> *)listOfInterfaceToDisplay;

@end
