//
//  UIButton+TitleImageStyle.h
//  TYButton
//
//  Created by iOS_Link on 2018/5/10.
//  Copyright © 2018年 iOS_Link. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    BtnImgTitleStyleDefault = 0,       //图片在左，文字在右，整体居中。
    BtnImgTitleStyleLeft  = 0,         //图片在左，文字在右，整体居中。
    BtnImgTitleStyleRight = 2,         //图片在右，文字在左，整体居中。
    BtnImgTitleStyleTop  = 3,          //图片在上，文字在下，整体居中。
    BtnImgTitleStyleBottom    = 4,     //图片在下，文字在上，整体居中。
    
    BtnImgTitleStyleCenterTop = 5,     //图片居中，文字在上距离按钮顶部。
    BtnImgTitleStyleCenterBottom = 6,  //图片居中，文字在下距离按钮底部。
    BtnImgTitleStyleCenterUp = 7,      //图片居中，文字在图片上面。
    BtnImgTitleStyleCenterDown = 8,    //图片居中，文字在图片下面。
    
    BtnImgTitleStyleRightLeft = 9,     //图片在右，文字在左，距离按钮两边边距
    BtnImgTitleStyleLeftRight = 10,    //图片在左，文字在右
    
} BtnImgTitleStyle;

@interface UIButton (TitleImageStyle)

/**
 设置 Btn 样式 需要Btn 的title 和image 同时存在

 @param style BtnImgTitleStyle
 @param padding 是调整布局时整个按钮和图文的间隔
 */
-(void)setButtonImageTitleStyle:(BtnImgTitleStyle)style padding:(CGFloat)padding;




@end
