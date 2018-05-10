//
//  UIButton+TitleImageStyle.m
//  TYButton
//
//  Created by iOS_Link on 2018/5/10.
//  Copyright © 2018年 iOS_Link. All rights reserved.
//
//
//    顺便普及一个小知识，在iOS开发 switch .. case 和 if .. else 使用场景中那个效率更高一点呢？
//    switch和if-else相比，由于使用了Binary Tree算法，绝大部分情况下switch会快一点，除非是if-else的第一个条件就为true.
//    说实话  我也没有深入研究过这个问题的根源
//    只是在实际开发中  没有人会去用很多很多else if的
//    都是用 switch case 的  后者比较清晰  给人感觉就是一个脑子很清楚的人写出来的东西
//    至于效率的本质  其实就是汇编的代码执行逻辑了
//
//    编译器编译switch与编译if...else...不同。不管有多少case，都直接跳转，不需逐个比较查询。

//    switch   效率高,     从汇编代码可以看出来
//    switch   只计算一次值   然后都是test   ,   jmp,
//    if...else   是每个条件都要计算一遍的.
//
//    switch的效率与分支数无关  只要是你的case 条件相对来说是连续的  如： 0 1 2 3 4 5 但是你的条件是如果是  1 1000 7777 3333  那么建议你去医院查查
//    当只有分支比较少的时候，if效率比switch高（因为switch有跳转表）
//    分支比较多，那当然是switch

#import "UIButton+TitleImageStyle.h"

@implementation UIButton (TitleImageStyle)

-(void)setButtonImageTitleStyle:(BtnImgTitleStyle)style padding:(CGFloat)padding
{
    if (self.imageView.image != nil && self.titleLabel.text != nil) //初始化
    {
        self.titleEdgeInsets = UIEdgeInsetsZero;
        self.imageEdgeInsets = UIEdgeInsetsZero;
        
        CGRect imageFrame = self.imageView.frame;
        CGRect titleFrame = self.titleLabel.frame;
        
        CGFloat totalHeight = imageFrame.size.height + padding + titleFrame.size.height;
        CGFloat btnHeight = self.frame.size.height;
        CGFloat btnWidth = self.frame.size.width;
        
        switch (style) {
            case BtnImgTitleStyleLeft://图片在左，文字在右，整体居中。
                if (padding != 0)
                {
                    self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                            padding/2,
                                                            0,
                                                            -padding/2);
                    
                    self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                            -padding/2,
                                                            0,
                                                            padding/2);
                }
                break;
                
            case BtnImgTitleStyleRight://图片在右，文字在左
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(imageFrame.size.width + padding/2),
                                                        0,
                                                        (imageFrame.size.width + padding/2));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (titleFrame.size.width+ padding/2),
                                                        0,
                                                        -(titleFrame.size.width+ padding/2));
            }
                break;
                
            case BtnImgTitleStyleTop://图片在上，文字在下
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(((btnHeight - totalHeight)/2 + imageFrame.size.height + padding - titleFrame.origin.y),
                                                        (btnWidth/2 - titleFrame.origin.x - titleFrame.size.width /2) - (btnWidth - titleFrame.size.width) / 2,
                                                        -((btnHeight - totalHeight)/2 + imageFrame.size.height + padding - titleFrame.origin.y),
                                                        -(btnWidth/2 - titleFrame.origin.x - titleFrame.size.width /2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(((btnHeight - totalHeight)/2 - imageFrame.origin.y),
                                                        (btnWidth /2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        -((btnHeight - totalHeight)/2 - imageFrame.origin.y),
                                                        -(btnWidth /2 - imageFrame.origin.x - imageFrame.size.width / 2));
                
            }
                break;
                
            case BtnImgTitleStyleBottom://图片在下，文字在上。
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(((btnHeight - totalHeight)/2 - titleFrame.origin.y),
                                                        (btnWidth/2 - titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2,
                                                        -((btnHeight - totalHeight)/2 - titleFrame.origin.y),
                                                        -(btnWidth/2 - titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(((btnHeight - totalHeight)/2 + titleFrame.size.height + padding - imageFrame.origin.y),
                                                        (btnWidth /2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        -((btnHeight - totalHeight)/2 + titleFrame.size.height + padding - imageFrame.origin.y),
                                                        -(btnWidth /2 - imageFrame.origin.x - imageFrame.size.width / 2));
            }
                break;
                
            case BtnImgTitleStyleCenterTop://图片居中，文字在上。
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleFrame.origin.y - padding),
                                                        (btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2,
                                                        (titleFrame.origin.y - padding),
                                                        -(btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        0,
                                                        -(btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2));
            }
                break;
                
            case BtnImgTitleStyleCenterBottom://图片居中，文字在下。
            {
                self.titleEdgeInsets = UIEdgeInsetsMake((btnHeight - padding - titleFrame.origin.y - titleFrame.size.height),
                                                        (btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2,
                                                        -(btnHeight - padding - titleFrame.origin.y - titleFrame.size.height),
                                                        -(btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        0,
                                                        -(btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2));
            }
                break;
                
            case BtnImgTitleStyleCenterUp://图片居中，文字在图片上面。
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(-(titleFrame.origin.y + titleFrame.size.height - imageFrame.origin.y + padding),
                                                        (btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2,
                                                        (titleFrame.origin.y + titleFrame.size.height - imageFrame.origin.y + padding),
                                                        -(btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        0,
                                                        -(btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2));
            }
                break;
                
            case BtnImgTitleStyleCenterDown://图片居中，文字在图片下面。
            {
                self.titleEdgeInsets = UIEdgeInsetsMake((imageFrame.origin.y + imageFrame.size.height - titleFrame.origin.y + padding),
                                                        (btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2,
                                                        -(imageFrame.origin.y + imageFrame.size.height - titleFrame.origin.y + padding),
                                                        -(btnWidth / 2 -  titleFrame.origin.x - titleFrame.size.width / 2) - (btnWidth - titleFrame.size.width) / 2);
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2),
                                                        0,
                                                        -(btnWidth / 2 - imageFrame.origin.x - imageFrame.size.width / 2));
            }
                break;
                
            case BtnImgTitleStyleRightLeft: //图片在右，文字在左
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(titleFrame.origin.x - padding),
                                                        0,
                                                        (titleFrame.origin.x - padding));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth - padding - imageFrame.origin.x - imageFrame.size.width),
                                                        0,
                                                        -(btnWidth - padding - imageFrame.origin.x - imageFrame.size.width));
            }
                break;
                
            case BtnImgTitleStyleLeftRight: //图片在左，文字在右
            {
                self.titleEdgeInsets = UIEdgeInsetsMake(0,
                                                        (btnWidth - padding - titleFrame.origin.x - titleFrame.size.width),
                                                        0,
                                                        -(btnWidth - padding - titleFrame.origin.x - titleFrame.size.width));
                
                self.imageEdgeInsets = UIEdgeInsetsMake(0,
                                                        -(imageFrame.origin.x - padding),
                                                        0,
                                                        (imageFrame.origin.x - padding));
            }
                break;
                
            default:
                break;
        }
    }
    else {
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
}

@end
