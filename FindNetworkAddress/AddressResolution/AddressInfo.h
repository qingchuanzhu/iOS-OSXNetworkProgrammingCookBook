//
//  AddressInfo.h
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 3/1/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <netdb.h>
#import <sys/socket.h>

@interface AddressInfo : NSObject

@property (nonatomic, strong) NSString *hostName, *serviceName;
@property (nonatomic) struct addrinfo *results;
@property (nonatomic) struct sockaddr *sa;
@property (nonatomic, readonly) int errorCode;

-(void)addrWithHostname:(NSString*)lHostname Service:(NSString *)lService andHints:(struct addrinfo*)lHints;
-(void)nameWithSockaddr:(struct sockaddr *)saddr;
-(NSString *)errorString;

@end
