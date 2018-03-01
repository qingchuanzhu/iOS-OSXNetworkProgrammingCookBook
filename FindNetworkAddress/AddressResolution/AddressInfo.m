//
//  AddressInfo.m
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 3/1/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import "AddressInfo.h"
#import <netinet/in.h>
#import <netinet6/in6.h>

@implementation AddressInfo

- (instancetype)init{
    if (self = [super init]) {
        [self setVars];
    }
    return self;
}

- (void)addrWithHostname:(NSString*)lHostname Service:(NSString *)lService andHints:(struct addrinfo*)lHints{
    
}

- (void)nameWithSockaddr:(struct sockaddr *)saddr{
    
}

- (NSString *)errorString{
    return @"";
}

- (void)setVars {
    self.hostName = @"";
    self.serviceName = @"";
    self.results = nil;
    _errorCode = 0; // you can not use the self.errorCode, since self.errorCode will envoke the accessor methods just like this properties is going to be modified by other objects.
}


@end
