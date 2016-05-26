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
    UIView *_bgView;
    UIButton *_saveBtn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _editImageViewArray = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeEdit:) name:@"remove" object:NULL];
    [self addUI];
}

- (void)addUI{
    UIImage *img = [UIImage imageNamed:@"a.png"];
    self.view.userInteractionEnabled = YES;
    UIView *bgView = [[UIView alloc] initWithFrame:self.view.frame];
    bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bgView];
    _bgView = bgView;
    
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
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.backgroundColor = [UIColor orangeColor];
    saveBtn.layer.cornerRadius = 5;
    saveBtn.frame = CGRectMake(20,self.view.frame.size.height - 60 , self.view.frame.size.width-40, 30);
    [saveBtn setTitle:@"保存相册" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    saveBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:saveBtn];
    _saveBtn = saveBtn;
}

- (void)saveBtnClick:(UIButton *)sender{
//    sender.hidden = YES;
    [self saveToPhotosAlbum];
}
//保存到相册
- (void)saveToPhotosAlbum{
    UIImage *viewImage = [self imageThumb];
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
}
//截图，获取到image
- (UIImage *)imageThumb{
    [self hideAllBtn];
    CGPoint point = [[_bgView superview] convertPoint:_bgView.frame.origin toView:_bgView];
    CGRect rect = CGRectMake(point.x, point.y, _bgView.frame.size.width, _bgView.frame.size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    [_bgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

- (void)hideAllBtn{
    for (EditImageView *editImgView in _editImageViewArray) {
        [editImgView hideEditBtn];
    }
}

- (void)tapClick:(UITapGestureRecognizer *)tapGesture{
    NSLog(@"tttttttt");
    [self hideAllBtn];
}

- (void)removeEdit:(NSNotification *)notify{
    EditImageView *editImgView = notify.object;
    [_editImageViewArray removeObject:editImgView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end






