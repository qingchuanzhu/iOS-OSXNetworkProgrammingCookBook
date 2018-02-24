//
//  NetworkAddressStore.m
//  FindNetworkAddress
//
//  Created by Qingchuan Zhu on 2/24/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import "NetworkAddressStore.h"
#include <ifaddrs.h>
#include <netdb.h>
#include <sys/socket.h>
#include <arpa/inet.h>

@implementation NetworkAddressStore
{
    NSMutableArray<NetworkAddrModel*> *interfaceList;
}

struct ifaddrs *interface = NULL;
int success = 0;

char naddr [INET6_ADDRSTRLEN];
char nmask [INET6_ADDRSTRLEN];
char ngate [INET6_ADDRSTRLEN];

- (instancetype)init{
    self = [super init];
    if (self) {
        interfaceList = [NSMutableArray new];
    }
    return self;
}

- (void)retriveAddressList{
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interface);
    if (success == 0) {
        struct ifaddrs *temp_addrs;
        for (temp_addrs = interface; temp_addrs != NULL; temp_addrs = temp_addrs->ifa_next) {
            int ipVersion;
            NSLog(@"**********************");
            if (temp_addrs->ifa_addr->sa_family == AF_INET) {
                NSLog(@"IPv4");
                ipVersion = AF_INET;
            } else if (temp_addrs->ifa_addr->sa_family == AF_INET6) {
                NSLog(@"IPv6");
                ipVersion = AF_INET6;
            } else {
                NSLog(@"Unknown version");
                ipVersion = 0;
            }
            if (ipVersion != 0) {
                NetworkAddrModel *newModel = [NetworkAddrModel new];
                newModel.interfaceName = [NSString stringWithUTF8String:temp_addrs->ifa_name];
                
                int len = (ipVersion == AF_INET) ? INET_ADDRSTRLEN : INET6_ADDRSTRLEN;
                if (ipVersion == AF_INET) {
                    inet_ntop(ipVersion,&((struct sockaddr_in *)temp_addrs->ifa_addr)->sin_addr,naddr,len);
                    newModel.addressString = [NSString stringWithUTF8String:naddr];
                    
                    if ((struct sockaddr_in *)temp_addrs->ifa_netmask != NULL) {
                        inet_ntop(ipVersion,&((struct sockaddr_in *)temp_addrs->ifa_netmask)->sin_addr,nmask,len);
                        newModel.maskString = [NSString stringWithUTF8String:nmask];
                    } else { newModel.maskString = @" "; }
                    
                    if ((struct sockaddr_in *)temp_addrs->ifa_dstaddr != NULL) {
                        inet_ntop(ipVersion,&((struct sockaddr_in *)temp_addrs->ifa_dstaddr)->sin_addr,ngate,len);
                        newModel.gatewayString = [NSString stringWithUTF8String:ngate];
                    } else {newModel.gatewayString = @" "; }
                    
                } else if (ipVersion == AF_INET6){
                    inet_ntop(ipVersion,&((struct sockaddr_in6 *)temp_addrs->ifa_addr)->sin6_addr,naddr,len);
                    newModel.addressString = [NSString stringWithUTF8String:naddr];
                    
                    if ((struct sockaddr_in6 *)temp_addrs->ifa_netmask != NULL) {
                        inet_ntop(ipVersion,&((struct sockaddr_in6 *)temp_addrs->ifa_netmask)->sin6_addr,nmask,len);
                        newModel.maskString = [NSString stringWithUTF8String:nmask];
                    } else { newModel.maskString = @" "; }
                    
                    if ((struct sockaddr_in6 *)temp_addrs->ifa_dstaddr != NULL) {
                        inet_ntop(ipVersion,&((struct sockaddr_in6 *)temp_addrs->ifa_dstaddr)->sin6_addr,ngate,len);
                        newModel.gatewayString = [NSString stringWithUTF8String:ngate];
                    } else {newModel.gatewayString = @" "; }
                    
                } else {
                    continue;
                }
                
                
                [interfaceList addObject:newModel];
            }
        }
    }
    freeifaddrs(interface);
}

- (NSArray<NetworkAddrModel *> *)listOfInterfaceToDisplay{
    if (interfaceList.count > 0) {
        return interfaceList;
    } else {
        [self retriveAddressList];
        return interfaceList;
    }
}

@end
