//
//  YUQuickViewWindow.h
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUQuickViewWindow : UIWindow

@property(nonatomic,strong) UIWindow *destWindow;

-(void)windowDidAppear;

@property(nonatomic,copy) void(^logViewClose)();

@end
