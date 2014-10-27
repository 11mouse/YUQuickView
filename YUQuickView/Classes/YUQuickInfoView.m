//
//  YUQuickInfoView.m
//  UIDebug
//
//  Created by duan on 14-10-19.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "YUQuickInfoView.h"

@interface YUQuickInfoView()
{
    UIColor *infoColor;
    CGFloat borderWidth;
    UIFont *infoFont;
    CGFloat btnBaseY;
    CGFloat btnBaseX;
    
    CGFloat btnW;
    CGFloat btnH;
    
    CGFloat infoBaseY;
    CGFloat infoBaseX;
    CGFloat infoW;
    CGFloat infoH;
    
    CGFloat opBtnBaseX;
    CGFloat opBtnSpace;
    CGFloat opBtnW;
    CGFloat opBtnH;
    
    CGFloat currOffsetY;
    
    UILabel *classNameLabel;
    UILabel *xLabel;
    UILabel *yLabel;
    UILabel *widthLabel;
    UILabel *heightLabel;
    UILabel *fontSizeLabel;
    
    UILabel *colorLabel;
    UILabel *colorRLabel;
    UILabel *colorGLabel;
    UILabel *colorBLabel;
    UILabel *colorALabel;
    
    UILabel *bgcolorLabel;
    UILabel *bgcolorRLabel;
    UILabel *bgcolorGLabel;
    UILabel *bgcolorBLabel;
    UILabel *bgcolorALabel;
    
}
@property(nonatomic,strong) UIView *destView;
@end

@implementation YUQuickInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentSize=CGSizeMake(self.frame.size.width, self.frame.size.height*3);
        self.contentOffset=CGPointMake(0, self.frame.size.height);
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        
        infoColor=Color_QuickViewText;
        borderWidth=Width_QuickViewBorder;
        infoFont=Font_QuickViewText;
        
        btnBaseY=30+self.frame.size.height;
        btnBaseX=0;
        btnW=50;
        btnH=25;
        
        infoBaseX=0;
        infoBaseY=80+self.frame.size.height;
        infoW=300;
        infoH=15;
        
        opBtnW=15;
        opBtnH=15;
        opBtnSpace=5;
        opBtnBaseX=260;
        [self layoutMainBtn];
        currOffsetY=0;
        classNameLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, self.frame.size.width, infoH*4) text:@""];
        classNameLabel.numberOfLines=0;
        [self addSubview:classNameLabel];
        currOffsetY+=infoH*4;
        
        [self layoutFrameInfo];
    }
    return self;
}

-(void)layoutMainBtn{
    CGFloat offsetX=0;
    [self addSubview:[self getInfoButton:CGRectMake(btnBaseX+offsetX, btnBaseY, btnW, btnH) text:@"Next" selector:@selector(nextBtn_Events)]];
    offsetX+=btnW;
    
    [self addSubview:[self getInfoButton:CGRectMake(btnBaseX+offsetX, btnBaseY, btnW, btnH) text:@"Per" selector:@selector(perBtn_Events)]];
    offsetX+=btnW;
    
    [self addSubview:[self getInfoButton:CGRectMake(btnBaseX+offsetX, btnBaseY, btnW, btnH) text:@"Sub" selector:@selector(subBtn_Events)]];
    offsetX+=btnW;
    
    [self addSubview:[self getInfoButton:CGRectMake(btnBaseX+offsetX, btnBaseY, btnW, btnH) text:@"Super" selector:@selector(superBtn_Events)]];
    offsetX+=btnW;
    [self addSubview:[self getInfoButton:CGRectMake(btnBaseX+offsetX, btnBaseY, btnW, btnH) text:@"Reset" selector:@selector(resetBtn_Events)]];
    offsetX+=btnW;
}

-(void)layoutFrameInfo{
    xLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:xLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(frameXAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(frameXCut)]];
     
    currOffsetY+=infoH;
    
    yLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:yLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(frameYAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(frameYCut)]];
    
    currOffsetY+=infoH;
    
    widthLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:widthLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(frameWAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(frameWCut)]];
    currOffsetY+=infoH;
    
    heightLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:heightLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(frameHAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(frameHCut)]];
    currOffsetY+=infoH;
    
    fontSizeLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:fontSizeLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(fontSizeAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(fontSizeCut)]];
    currOffsetY+=infoH;
    
    colorLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:colorLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(colorAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(colorCut)]];
    currOffsetY+=infoH;
    
    colorRLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:colorRLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(colorRAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(colorRCut)]];
    currOffsetY+=infoH;
    
    colorGLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:colorGLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(colorGAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(colorGCut)]];
    currOffsetY+=infoH;
    
    colorBLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:colorBLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(colorBAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(colorBCut)]];
    currOffsetY+=infoH;
    
    colorALabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:colorALabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(colorAAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(colorACut)]];
    currOffsetY+=infoH;
    
    bgcolorLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:bgcolorLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(bgcolorAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(bgcolorCut)]];
    currOffsetY+=infoH;
    
    bgcolorRLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:bgcolorRLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(bgcolorRAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(bgcolorRCut)]];
    currOffsetY+=infoH;
    
    bgcolorGLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:bgcolorGLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(bgcolorGAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(bgcolorGCut)]];
    currOffsetY+=infoH;
    
    bgcolorBLabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:bgcolorBLabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(bgcolorBAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(bgcolorBCut)]];
    currOffsetY+=infoH;
    
    bgcolorALabel=[self getInfoLabel:CGRectMake(infoBaseX, infoBaseY+currOffsetY, infoW, infoH) text:@""];
    [self addSubview:bgcolorALabel];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"+" selector:@selector(bgcolorAAdd)]];
    [self addSubview:[self getInfoButton:CGRectMake(opBtnBaseX+opBtnSpace+opBtnW, infoBaseY+currOffsetY, opBtnW, opBtnH) text:@"-" selector:@selector(bgcolorACut)]];
    currOffsetY+=infoH;
}

-(void)updateInfo{
    [self updateInfo:_destView];
    self.destViewUpdate(_destView);
}

-(void)updateInfo:(UIView*)destView{
    self.destView=destView;
    
    classNameLabel.text=[NSString stringWithFormat:@"%@",destView];
    
    xLabel.text=[NSString stringWithFormat:@"x:%f",destView.frame.origin.x];
    yLabel.text=[NSString stringWithFormat:@"y:%f",destView.frame.origin.y];
    widthLabel.text=[NSString stringWithFormat:@"w:%f",destView.frame.size.width];
    heightLabel.text=[NSString stringWithFormat:@"h:%f",destView.frame.size.height];
    
    fontSizeLabel.text=@"";
    if ([destView respondsToSelector:@selector(font)]) {
        UIFont *font=[destView performSelector:@selector(font)];
        if (font) {
            fontSizeLabel.text=[NSString stringWithFormat:@"font size:%f",font.pointSize];
        }
    }
    
    colorLabel.text=@"";
    colorRLabel.text=@"";
    colorGLabel.text=@"";
    colorBLabel.text=@"";
    colorALabel.text=@"";
    if ([destView respondsToSelector:@selector(textColor)]) {
        UIColor *color=[destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            colorLabel.text=[NSString stringWithFormat:@"textColor R:%0.f G:%0.f B:%0.f A:%0.f",colorR*255,colorG*255,colorB*255,colorA*255];
            colorRLabel.text=[NSString stringWithFormat:@"R:%0.f",colorR*255];
            colorGLabel.text=[NSString stringWithFormat:@"G:%0.f",colorG*255];
            colorBLabel.text=[NSString stringWithFormat:@"B:%0.f",colorB*255];
            colorALabel.text=[NSString stringWithFormat:@"A:%0.f",colorA*255];
        }
    }
    
    bgcolorLabel.text=@"";
    bgcolorRLabel.text=@"";
    bgcolorGLabel.text=@"";
    bgcolorBLabel.text=@"";
    bgcolorALabel.text=@"";
    if ([destView respondsToSelector:@selector(backgroundColor)]) {
        UIColor *color=[destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            bgcolorLabel.text=[NSString stringWithFormat:@"backgroundColor R:%0.f G:%0.f B:%0.f A:%0.f",colorR*255,colorG*255,colorB*255,colorA*255];
            bgcolorRLabel.text=[NSString stringWithFormat:@"R:%0.f",colorR*255];
            bgcolorGLabel.text=[NSString stringWithFormat:@"G:%0.f",colorG*255];
            bgcolorBLabel.text=[NSString stringWithFormat:@"B:%0.f",colorB*255];
            bgcolorALabel.text=[NSString stringWithFormat:@"A:%0.f",colorA*255];
        }
    }
}

-(void)superBtn_Events{
    if (_destView.superview) {
        _destView=_destView.superview;
        [self updateInfo];
    }
    
}

-(void)subBtn_Events{
    if (_destView.subviews&&_destView.subviews.count>0) {
        _destView=_destView.subviews[0];
        [self updateInfo];
    }
}

-(void)nextBtn_Events{
    NSInteger index=[_destView.superview.subviews indexOfObject:_destView];
    if (index<_destView.superview.subviews.count-1) {
        _destView=[_destView.superview.subviews objectAtIndex:index+1];
        [self updateInfo];
    }
}

-(void)perBtn_Events{
    NSInteger index=[_destView.superview.subviews indexOfObject:_destView];
    if (index>0) {
        _destView=[_destView.superview.subviews objectAtIndex:index-1];
        [self updateInfo];
    }
}

-(void)resetBtn_Events{
    self.resetState();
}

-(UILabel*)getInfoLabel:(CGRect)frame text:(NSString*)text{
    UILabel *label=[[UILabel alloc] initWithFrame:frame];
    label.backgroundColor=[UIColor clearColor];
    label.textColor=infoColor;
    label.font=infoFont;
    label.text=text;
    return label;
}

-(UIButton*)getInfoButton:(CGRect)frame text:(NSString*)text selector:(SEL)selector{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.borderWidth=borderWidth;
    btn.layer.borderColor=infoColor.CGColor;
    [btn setTitleColor:infoColor forState:UIControlStateNormal];
    btn.frame=frame;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font=infoFont;
    return btn;
}

@end

@implementation YUQuickInfoView(Frame)

-(void)frameXAdd{
    _destView.frame=CGRectMake(_destView.frame.origin.x+1, _destView.frame.origin.y, _destView.frame.size.width, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameXCut{
    _destView.frame=CGRectMake(_destView.frame.origin.x-1, _destView.frame.origin.y, _destView.frame.size.width, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameYAdd{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y+1, _destView.frame.size.width, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameYCut{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y-1, _destView.frame.size.width, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameWAdd{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y, _destView.frame.size.width+1, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameWCut{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y, _destView.frame.size.width-1, _destView.frame.size.height);
    [self updateInfo];
}

-(void)frameHAdd{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y, _destView.frame.size.width, _destView.frame.size.height+1);
    [self updateInfo];
}

-(void)frameHCut{
    _destView.frame=CGRectMake(_destView.frame.origin.x, _destView.frame.origin.y, _destView.frame.size.width, _destView.frame.size.height-1);
    [self updateInfo];
}

-(void)fontSizeAdd{
    if ([_destView respondsToSelector:@selector(setFont:)]&&[_destView respondsToSelector:@selector(font)]) {
        UIFont *font=[_destView performSelector:@selector(font)];
        if (font) {
            [_destView performSelector:@selector(setFont:) withObject:[UIFont fontWithName:font.fontName size:font.pointSize+1]];
            [self updateInfo];
        }
    }
}

-(void)fontSizeCut{
    if ([_destView respondsToSelector:@selector(setFont:)]&&[_destView respondsToSelector:@selector(font)]) {
        UIFont *font=[_destView performSelector:@selector(font)];
        if (font) {
            [_destView performSelector:@selector(setFont:) withObject:[UIFont fontWithName:font.fontName size:font.pointSize-1]];
            [self updateInfo];
        }
    }
}

-(void)colorAdd{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:roundf((colorG*255)+1)/255.0 blue:roundf((colorB*255)+1)/255.0 alpha:roundf((colorA*255)+1)/255.0]];
            [self updateInfo];
        }
    }
}
-(void)colorCut{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:roundf((colorG*255)-1)/255.0 blue:roundf((colorB*255)-1)/255.0 alpha:roundf((colorA*255)-1)/255.0]];
            [self updateInfo];
        }
    }
}

-(void)colorRAdd{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:colorG blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorRCut{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)-1)/255.0 green:colorG blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorGAdd{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:roundf((colorG*255)+1)/255.0 blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorGCut{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:roundf((colorG*255)-1)/255.0 blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorBAdd{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:roundf((colorB*255)+1)/255.0 alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorBCut{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:roundf((colorB*255)-1)/255.0 alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)colorAAdd{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:colorB alpha:roundf((colorA*255)+1)/255.0]];
            [self updateInfo];
        }
    }
}

-(void)colorACut{
    if ([_destView respondsToSelector:@selector(textColor)]&&[_destView respondsToSelector:@selector(setTextColor:)]) {
        UIColor *color=[_destView performSelector:@selector(textColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setTextColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:colorB alpha:roundf((colorA*255)-1)/255.0]];
            [self updateInfo];
        }
    }
}




-(void)bgcolorAdd{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:roundf((colorG*255)+1)/255.0 blue:roundf((colorB*255)+1)/255.0 alpha:roundf((colorA*255)+1)/255.0]];
            [self updateInfo];
        }
    }
}
-(void)bgcolorCut{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:roundf((colorG*255)-1)/255.0 blue:roundf((colorB*255)-1)/255.0 alpha:roundf((colorA*255)-1)/255.0]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorRAdd{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)+1)/255.0 green:colorG blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorRCut{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:roundf((colorR*255)-1)/255.0 green:colorG blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorGAdd{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:roundf((colorG*255)+1)/255.0 blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorGCut{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:roundf((colorG*255)-1)/255.0 blue:colorB alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorBAdd{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:roundf((colorB*255)+1)/255.0 alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorBCut{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:roundf((colorB*255)-1)/255.0 alpha:colorA]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorAAdd{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:colorB alpha:roundf((colorA*255)+1)/255.0]];
            [self updateInfo];
        }
    }
}

-(void)bgcolorACut{
    if ([_destView respondsToSelector:@selector(backgroundColor)]&&[_destView respondsToSelector:@selector(setBackgroundColor:)]) {
        UIColor *color=[_destView performSelector:@selector(backgroundColor)];
        if (color) {
            CGFloat colorR,colorG,colorB,colorA;
            [color getRed:&colorR green:&colorG blue:&colorB alpha:&colorA];
            [_destView performSelector:@selector(setBackgroundColor:) withObject:[UIColor colorWithRed:colorR green:colorG blue:colorB alpha:roundf((colorA*255)-1)/255.0]];
            [self updateInfo];
        }
    }
}
@end
