//
//  YUQuickInfoView.h
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Width_QuickViewBorder 1
#define Color_QuickViewText [UIColor colorWithWhite:0.0 alpha:0.5]
#define Font_QuickViewText [UIFont systemFontOfSize:14]

@interface YUQuickInfoView : UIScrollView

-(void)updateInfo:(UIView*)destView;

@property(nonatomic,copy) void(^destViewUpdate)(UIView *view);

@property(nonatomic,copy) void(^resetState)();

@end
@class YUQuickViewOpBtn;
@interface YUQuickInfoView(Frame)

-(void)frameX:(YUQuickViewOpBtn*)btn;
-(void)frameY:(YUQuickViewOpBtn*)btn;
-(void)frameW:(YUQuickViewOpBtn*)btn;
-(void)frameH:(YUQuickViewOpBtn*)btn;
-(void)fontSize:(YUQuickViewOpBtn*)btn;

-(void)color:(YUQuickViewOpBtn*)btn;
-(void)colorR:(YUQuickViewOpBtn*)btn;
-(void)colorG:(YUQuickViewOpBtn*)btn;
-(void)colorB:(YUQuickViewOpBtn*)btn;
-(void)colorA:(YUQuickViewOpBtn*)btn;

-(void)bgcolor:(YUQuickViewOpBtn*)btn;
-(void)bgcolorR:(YUQuickViewOpBtn*)btn;
-(void)bgcolorG:(YUQuickViewOpBtn*)btn;
-(void)bgcolorB:(YUQuickViewOpBtn*)btn;
-(void)bgcolorA:(YUQuickViewOpBtn*)btn;
@end

@interface YUQuickViewOpBtn : UIButton

@property(nonatomic) CGFloat opValue;

@end
