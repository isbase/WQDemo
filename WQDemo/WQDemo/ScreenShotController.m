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
    _showImageView.image = [self imageFromView:self.view atFrame:CGRectMake(100, 250, 200, 200)];
}

#pragma mark - 截图
-(UIImage *)getImageFromView:(UIView *)orgView{
    UIGraphicsBeginImageContext(orgView.bounds.size);
    [orgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext(); return image;
}

#pragma mark - 某个view指定区域
- (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}


#pragma mark - test
-(UIImage *)getImageFromView:(UIImage *)orgImage inRect:(CGRect)rect
{
    CGRect rc = CGRectMake(0, 0, orgImage.size.width, orgImage.size.height);
    UIGraphicsBeginImageContext(rc.size);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextClipToRect(ref, rect);
    CGContextDrawImage(ref, rect, orgImage.CGImage);
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
