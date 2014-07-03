//
//  DetailViewController.h
//  WQDemo
//
//  Created by dev on 14-7-3.
//  Copyright (c) 2014年 Today. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
