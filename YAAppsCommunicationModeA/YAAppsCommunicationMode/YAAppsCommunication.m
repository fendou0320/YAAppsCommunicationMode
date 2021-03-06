//
//  YAAppsCommunication.m
//  YAAppsCommunicationB
//
//  Created by lanjiying on 2018/4/18.
//  Copyright © 2018年 lanjiying_Angelia. All rights reserved.
//

#import "YAAppsCommunication.h"
#import <UIKit/UIKit.h>
#import "YAKeyChain.h"
#import "YAActivity.h"

@implementation YAAppsCommunication

+ (void)communicationWithURLScheme
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"AppsCommunicationTest://?nick:lanjiying&age:18"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"AppsCommunicationTest://?nick:lanjiying&age:18"]];
    }else{
        [YAAppsCommunication showAlert:@"no this Apps " message:@"you can build another app on your phone"];
    }
}
+ (void)communicationWithKeyChain
{
    NSDictionary *userInfo = @{@"nick":@"lanjiying",@"age":@"18",@"user_image":[UIImage imageNamed:@"my_information_user"]};

    if ([YAKeyChain keyChainSaveData:userInfo withIdentifier:@"userinfo"]) {
        NSLog(@"%@",[YAKeyChain keyChainReadData:@"userinfo"]);
        [YAAppsCommunication showAlert:@"save successfully" message:@"Congratulations! The data save successfully and you can open another app in order to check the data"];
    }else{
        [YAAppsCommunication showAlert:@"Save failed" message:@"check your data"];
    }
    
}
+ (void)communicationWithPasteboard
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
     [pasteboard setURL:[NSURL URLWithString:@"http://lanjiying.allenqin.com"]];
    if (pasteboard.URL) {
       [YAAppsCommunication showAlert:@"save successfully" message:@"the data has saved，you can also save other objects such as data、items、images.They you can open anothe app check out the string now"];
    }else{
       [YAAppsCommunication showAlert:@"save failed" message:@"the data save failed,you can confirm that the data is right"];
    }
}
+ (void)communicationWithActivityViewController
{
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mine_wxpay@2x" ofType:@"jpeg"]]];
    NSArray *shareArray = @[image];
    NSArray *activitys = @[[[YAActivity alloc]init]];
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:shareArray applicationActivities:activitys];
    activityController.excludedActivityTypes = @[UIActivityTypePrint,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList];
    activityController.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
    };
    [[[UIApplication sharedApplication]keyWindow].rootViewController presentViewController:activityController animated:YES completion:^{
        
    }];
    
}
+ (void)showAlert:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    [[[UIApplication sharedApplication]keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{
        
    }];
}
@end
