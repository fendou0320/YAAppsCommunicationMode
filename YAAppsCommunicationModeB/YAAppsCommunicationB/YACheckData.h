//
//  YACheckData.h
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YACheckData : NSObject

+ (void)checkKeyChainData;
+ (void)checkPasteboard;
+(void)showMessageAlert:(NSObject *)title message:(NSObject *)message;

@end
