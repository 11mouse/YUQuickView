//
//  YUQuickViewWindow.m
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "YUQuickViewWindow.h"
#import "YUQuickInfoView.h"

@interface YUQuickViewWindow()
{
    UITapGestureRecognizer *tapGestureRecognizer;
    BOOL enableDebug;
    UIView *panelView;
    UIView *resultView;
    CGFloat resultLevelValue;
    UIView *viewArea;
    
    UIButton *closeBtn;
    
    YUQuickInfoView *infoView;
}

-(void)updateResultView:(UIView*)view;

-(void)resetState;
    
@end

@implementation YUQuickViewWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)windowDidAppear{
    if (!tapGestureRecognizer) {
        tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logTap:)];
        tapGestureRecognizer.numberOfTapsRequired=1;
        panelView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    if (!closeBtn) {
        closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.layer.borderWidth=Width_QuickViewBorder;
        closeBtn.layer.borderColor=Color_QuickViewText.CGColor;
        [closeBtn setTitleColor:Color_QuickViewText forState:UIControlStateNormal];
        closeBtn.frame=CGRectMake(self.frame.size.width-50, 20, 50, 25);
        [closeBtn setTitle:@"Close" forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtn_Events) forControlEvents:UIControlEventTouchUpInside];
        closeBtn.titleLabel.font=Font_QuickViewText;
    }
    if (!viewArea) {
        viewArea=[[UIView alloc] initWithFrame:CGRectZero];
        viewArea.layer.borderColor=[UIColor redColor].CGColor;
        viewArea.layer.borderWidth=1;
    }
    
    if (!infoView) {
        infoView=[[YUQuickInfoView alloc] initWithFrame:panelView.frame];
        __block YUQuickViewWindow *blockself=self;
        infoView.destViewUpdate=^(UIView *view){
            [blockself updateResultView:view];
        };
        infoView.resetState=^(){
            [blockself resetState];
        };
    }
    
    [panelView addGestureRecognizer:tapGestureRecognizer];
    [self addSubview:panelView];
    [self addSubview:infoView];
    infoView.hidden=YES;
    [self addSubview:closeBtn];
}

-(void)closeBtn_Events{
    [panelView removeGestureRecognizer:tapGestureRecognizer];
    [panelView removeFromSuperview];
    [closeBtn removeFromSuperview];
    [infoView removeFromSuperview];
    [viewArea removeFromSuperview];
    self.logViewClose();
}

-(void)logTap:(UITapGestureRecognizer*)tapGes{
    CGPoint tapPoint=[tapGes locationInView:panelView];
    int level=0;
    resultLevelValue=0;
    [self checkView:self.destWindow eventPoint:tapPoint level:level levelValue:[self getLevelValue:level]];
    CGRect windowFrame=[resultView.superview convertRect:resultView.frame toView:self];
    viewArea.frame=windowFrame;
    [panelView addSubview:viewArea];
    infoView.hidden=NO;
    [infoView updateInfo:resultView];
    [panelView removeGestureRecognizer:tapGestureRecognizer];
}

-(void)updateResultView:(UIView*)view{
    resultView=view;
    CGRect windowFrame=[resultView.superview convertRect:resultView.frame toView:self];
    viewArea.frame=windowFrame;
}

-(void)resetState{
    [viewArea removeFromSuperview];
    infoView.hidden=YES;
    [panelView addGestureRecognizer:tapGestureRecognizer];
}

-(void)checkView:(UIView*)rootView eventPoint:(CGPoint)point level:(int)level levelValue:(CGFloat)levelValue{
    level++;
    NSInteger index=0;
    BOOL existsEventSubView=NO;
    for (UIView *subView in [rootView isKindOfClass:[UITableView class]]?((UITableView*)rootView).visibleCells:rootView.subviews) {
        CGRect windowFrame=[rootView convertRect:subView.frame toView:self.destWindow];
        if (CGRectContainsPoint(windowFrame, point)) {
            existsEventSubView=YES;
            if (subView.subviews&&subView.subviews.count>0) {
                [self checkView:subView eventPoint:point level:level levelValue:levelValue+index*[self getLevelValue:level]];
            }else{
                CGFloat currLevelValue=levelValue+index*[self getLevelValue:level];
                if (currLevelValue>resultLevelValue) {
                    resultLevelValue=currLevelValue;
                    resultView=subView;
                }
            }
        }
        index++;
    }
    if (!existsEventSubView) {
        if (levelValue>resultLevelValue) {
            resultLevelValue=levelValue;
            resultView=rootView;
        }
    }
}

-(CGFloat)getLevelValue:(int)level{
    return pow(10, 10-level);
}


@end
