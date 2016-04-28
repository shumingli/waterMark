//
//  ViewController.m
//  WaterMarkDemo
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "EditImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIImage *img = [UIImage imageNamed:@"a.png"];
    self.view.userInteractionEnabled = YES;
    EditImageView *editImgView = [[EditImageView alloc] initWithFrame:CGRectMake(100, 100, img.size.width, img.size.height)];
    editImgView.image = img;
    [self.view addSubview:editImgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
