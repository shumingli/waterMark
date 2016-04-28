//
//  ViewController.m
//  WaterMarkDemo
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "EditImageView.h"

@interface ViewController (){
    NSMutableArray *_editImageViewArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    _editImageViewArray = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeEdit:) name:@"remove" object:NULL];
    [self addUI];
}

- (void)addUI{
    UIImage *img = [UIImage imageNamed:@"a.png"];
    self.view.userInteractionEnabled = YES;
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
    bgView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgView];
    
    UIView *tabView = [[UIView alloc] initWithFrame:bgView.frame];
    tabView.backgroundColor = [UIColor clearColor];
    [bgView addSubview:tabView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [tabView addGestureRecognizer:tap];
    
    EditImageView *editImgView = [[EditImageView alloc] initWithFrame:CGRectMake(100, 100, img.size.width, img.size.height)];
    editImgView.image = img;
    [bgView addSubview:editImgView];
    [_editImageViewArray addObject:editImgView];
    
    UIImage *img2 = [UIImage imageNamed:@"b.png"];
    self.view.userInteractionEnabled = YES;
    EditImageView *editImgView2 = [[EditImageView alloc] initWithFrame:CGRectMake(100,editImgView.frame.origin.y + editImgView.frame.size.height + 40, img2.size.width, img2.size.height)];
    editImgView2.image = img2;
    [bgView addSubview:editImgView2];
    [_editImageViewArray addObject:editImgView2];
    
    
}

- (void)tapClick:(UITapGestureRecognizer *)tapGesture{
    NSLog(@"tttttttt");
    for (EditImageView *editImgView in _editImageViewArray) {
        [editImgView hideEditBtn];
    }
}

- (void)removeEdit:(NSNotification *)notify{
    EditImageView *editImgView = notify.object;
    [_editImageViewArray removeObject:editImgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end






