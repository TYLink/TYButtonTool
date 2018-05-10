//
//  ViewController.m
//  TYButton
//
//  Created by Dnion on 2018/5/10.
//  Copyright © 2018年 Link_TianYang. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+TitleImageStyle.h"

#define LINKWIDTH [[UIScreen mainScreen] bounds].size.width
#define LINKHEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    for (int index = 0; index < 11; index ++) {
        
        NSInteger W = LINKWIDTH/2 - 30;
        NSInteger H = LINKHEIGHT/6 - 20;
        
        NSInteger Y = index/2;
        NSInteger X =  index%2;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20 + (W + 10)*X ,20 + (H + 10)*Y,W,H)];
        button.backgroundColor = [UIColor blueColor];
        [button setTitle:@"Link Test" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"ICON"] forState:UIControlStateNormal];
        [button setButtonImageTitleStyle:index padding:10];
        
        [self.view addSubview:button];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
