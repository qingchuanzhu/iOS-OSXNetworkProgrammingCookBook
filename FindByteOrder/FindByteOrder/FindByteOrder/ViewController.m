//
//  ViewController.m
//  FindByteOrder
//
//  Created by Qingchuan Zhu on 2/23/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic, assign) EndianType endType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.endType = [self byteOrder];
    NSString *result = @"";
    
    switch (self.endType) {
        case ENDIAN_LITTLE:
            result = @"Little";
            break;
        case ENDIAN_BIG:
            result = @"Big";
            break;
        default:
            result = @"unknow";
            break;
    }
    [self.resultLabel setText:result];
}

- (EndianType)byteOrder{
    EndianType type = ENDIAN_UNKNOW;
    /*
     Using union, sNum and cNum shares the same memory space, thus cNum[0] corresponding to lower end of address while cNum[1] corresponds to higher end of address.
     If cNum[0] == 1 && cNum[1] == 2, then, higer byte of data is stored at lower address, leading to Big-endian
     */
    union{
        short sNum;
        char cNum[sizeof(short)];
    } un;
    
    un.sNum = 0x0102;
    // short type contains 2 bytes(16 bits)
    if (sizeof(short) == 2) {
        if (un.cNum[0] == 1 && un.cNum[1] == 2) {
            type = ENDIAN_BIG;
        } else if (un.cNum[0] == 2 && un.cNum[1] == 1){
            type = ENDIAN_LITTLE;
        } else {
            type = ENDIAN_UNKNOW;
        }
    } else {
        type = ENDIAN_UNKNOW;
    }
    return type;
}


@end
