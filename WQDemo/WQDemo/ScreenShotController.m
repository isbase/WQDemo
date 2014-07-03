//
//  ScreenShotController.m
//  WQDemo
//
//  Created by dev on 14-7-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import "ScreenShotController.h"

@interface ScreenShotController ()
{
    UIImageView *_showImageView;
}

@end

@implementation ScreenShotController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    [button setTitle:@"截取屏幕" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 40)];
    [button2 setTitle:@"截图" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor yellowColor];
    [button2 addTarget:self action:@selector(onButtonClickw2222:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    _showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 200, 200)];
    _showImageView.image = [UIImage imageNamed:@"duola.jpg"];
    [self.view addSubview:_showImageView];
    
    
    
    
}

-(void)onButtonClick:(id)sender
{
    _showImageView.image = [self getImageFromView:self.view];
}

-(void)onButtonClickw2222:(id)sender
{
    _showImageView.image = [self getImageFromView:self.view inRect:CGRectMake(200, 250, 100, 100)];
}

#pragma mark - 截图
-(UIImage *)getImageFromView:(UIView *)orgView{
    UIGraphicsBeginImageContext(orgView.bounds.size);
    [orgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return image;
}

-(UIImage *)getImageFromView:(UIView *)orgView inRect:(CGRect)rect
{
    
    CGContextRef ref = UIGraphicsGetCurrentContext()
    UIGraphicsBeginImageContext(orgView.bounds.size);
    [orgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    CGContextRef context=UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(context);
    CGContextAddRect(context, rect);
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFill);
    CGContextFlush(context); // 强制执行上面定义的操作
    UIImage* image =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsPopContext();
    return image;
}


/**
 UIGraphicsBeginImageContext(CGMakeSize(200,200));
 CGContextRefcontext=UIGraphicsGetCurrentContext();
 UIGraphicsPushContext(context);
 // ...把图写到context中，省略[indent]CGContextBeginPath();
 
 
 CGContextAddRect(CGMakeRect(0,0,100,100));
 CGContextClosePath();[/indent]CGContextDrawPath();
 CGContextFlush(); // 强制执行上面定义的操作
 UIImage* image = UIGraphicGetImageFromCurrentImageContext();
 UIGraphicsPopContext();
 */



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
