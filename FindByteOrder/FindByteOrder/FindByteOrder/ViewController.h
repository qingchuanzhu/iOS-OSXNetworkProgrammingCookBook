//
//  ViewController.h
//  FindByteOrder
//
//  Created by Qingchuan Zhu on 2/23/18.
//  Copyright © 2018 Qingchuan Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, EndianType) {
    ENDIAN_UNKNOW,
    ENDIAN_LITTLE,
    ENDIAN_BIG
};

@interface ViewController : UIViewController

@end

