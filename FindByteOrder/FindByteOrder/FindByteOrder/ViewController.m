//
//  ViewController.m
//  FindByteOrder
//
//  Created by Qingchuan Zhu on 2/23/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (EndianType)byteOrder{
    EndianType type = ENDIAN_UNKNOW;
    union{
        short sNum;
        char cNum[sizeof(short)];
    } un;
    
    un.sNum = 0x0102;
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
