//
//  YUQuickInfoView.h
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Width_QuickViewBorder 1
#define Color_QuickViewText [UIColor colorWithWhite:0.0 alpha:0.1]
#define Font_QuickViewText [UIFont systemFontOfSize:12]

@interface YUQuickInfoView : UIScrollView

-(void)updateInfo:(UIView*)destView;

@property(nonatomic,copy) void(^destViewUpdate)(UIView *view);

@property(nonatomic,copy) void(^resetState)();

@end

@interface YUQuickInfoView(Frame)

-(void)frameXAdd;
-(void)frameXCut;
-(void)frameYAdd;
-(void)frameYCut;
-(void)frameWAdd;
-(void)frameWCut;
-(void)frameHAdd;
-(void)frameHCut;
-(void)fontSizeAdd;
-(void)fontSizeCut;

-(void)colorAdd;
-(void)colorCut;
-(void)colorRAdd;
-(void)colorRCut;
-(void)colorGAdd;
-(void)colorGCut;
-(void)colorBAdd;
-(void)colorBCut;
-(void)colorAAdd;
-(void)colorACut;

-(void)bgcolorAdd;
-(void)bgcolorCut;
-(void)bgcolorRAdd;
-(void)bgcolorRCut;
-(void)bgcolorGAdd;
-(void)bgcolorGCut;
-(void)bgcolorBAdd;
-(void)bgcolorBCut;
-(void)bgcolorAAdd;
-(void)bgcolorACut;
@end
