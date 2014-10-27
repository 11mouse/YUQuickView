//
//  YUQuickView.m
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "YUQuickView.h"
#import "YUQuickViewWindow.h"

@interface YUQuickView(){
    BOOL enableQuickView;
    YUQuickViewWindow* quickWindow;
    
    UITapGestureRecognizer *tapGestureRecognizer;
}

@end

@implementation YUQuickView

+(YUQuickView*)defaultIntance{
    static YUQuickView* shareIntance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareIntance=[[YUQuickView alloc] init];
    });
    return shareIntance;
}

-(void)enableQuickView:(BOOL)enable{
    enableQuickView=enable;
    if (enableQuickView) {
        quickWindow=[[YUQuickViewWindow alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, 20, 20)];
        UIWindow *appWindow=[UIApplication sharedApplication].keyWindow;
        quickWindow.backgroundColor=[UIColor colorWithWhite:0.1 alpha:0.1];
        quickWindow.windowLevel=UIWindowLevelStatusBar+1;
        [quickWindow makeKeyAndVisible];
        [appWindow makeKeyAndVisible];
        
        tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logTap)];
        tapGestureRecognizer.numberOfTapsRequired=3;
        [quickWindow addGestureRecognizer:tapGestureRecognizer];
    }
}

-(void)logTap{
    if (quickWindow) {
        quickWindow.windowLevel=UIWindowLevelStatusBar-1;
        quickWindow.backgroundColor=[UIColor colorWithWhite:0.1 alpha:0.0];
        [UIView animateWithDuration:0.3 animations:^{
            quickWindow.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        } completion:^(BOOL finished) {
            
            [quickWindow windowDidAppear];
            quickWindow.destWindow=[UIApplication sharedApplication].keyWindow;
            __block UIWindow *blockLogWindow=quickWindow;
            quickWindow.logViewClose=^(){
                [UIView animateWithDuration:0.3 animations:^{
                    blockLogWindow.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2,0, 20, 20);
                } completion:^(BOOL finished) {
                    blockLogWindow.windowLevel=UIWindowLevelStatusBar+1;
                    blockLogWindow.backgroundColor=[UIColor colorWithWhite:0.1 alpha:0.1];
                }];
            };
        }];
    }
}

@end
