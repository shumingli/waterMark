//
//  EditImageView.m
//  WaterMarkDemo
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "EditImageView.h"

@implementation EditImageView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self addUI];
    }
    return self;
}

- (void)addUI{
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width-5*2, self.frame.size.height-5*2)];
    borderView.backgroundColor = [UIColor clearColor];
    borderView.layer.borderColor = [UIColor whiteColor].CGColor;
    borderView.layer.borderWidth = 2;
    borderView.layer.masksToBounds = YES;
    [self addSubview:borderView];
    
    UIImage *editImg = [UIImage imageNamed:@"Enlarge.png"];
    UIImageView *editImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-editImg.size.width/2-5, -5, editImg.size.width, editImg.size.height)];
    editImgView.image = editImg;
    editImgView.center = CGPointMake(borderView.frame.origin.x+borderView.frame.size.width, borderView.frame.origin.y);
    [self addSubview:editImgView];
    _editImgView = editImgView;
    
    UIImage *closeImg = [UIImage imageNamed:@"Close.png"];
    UIImageView *closeImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, self.frame.size.height - 5, closeImg.size.width, closeImg.size.height)];
    closeImgView.image = closeImg;
    closeImgView.center = CGPointMake(borderView.frame.origin.x, borderView.frame.origin.y+borderView.frame.size.height);
    [self addSubview:closeImgView];
    _closeImgView = closeImgView;
    
   _len = sqrt(self.frame.size.width/2*self.frame.size.width/2+self.frame.size.height/2*self.frame.size.height/2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    _startTouchPoint = [touch locationInView:self.superview];
    _startTouchCenter = self.center;
    _isMove = YES;
    CGPoint p = [touch locationInView:self];
    if (CGRectContainsPoint(_editImgView.frame,p)) {
        _isMove = NO;
    }

}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesMoved");
    if (_isMove) {
        CGPoint curPoint = [[touches anyObject] locationInView:self.superview];
        self.center =  CGPointMake(curPoint.x-(_startTouchPoint.x-_startTouchCenter.x), curPoint.y-(_startTouchPoint.y-_startTouchCenter.y));
    }else{
        CGPoint curPoint = [[touches anyObject] locationInView:self.superview];
        CGFloat sx = curPoint.x - self.center.x;
        CGFloat sy = curPoint.y - self.center.y;
        CGFloat curLen = sqrtf(sx*sx+sy*sy);
        CGFloat scale = curLen/_len;
        CGFloat tan = atanf(sy/sx);  //取到弧度
        CGFloat angle = tan * 180/M_PI;
        if (sx >= 0) {
            angle = angle + 45;
        }else{
            angle = angle + 225;
        }
        CGFloat rad = angle/180*M_PI;
        self.transform = CGAffineTransformMakeScale(scale, scale);
        self.transform = CGAffineTransformRotate(self.transform,rad);
//        self.transform = CGAffineTransformMakeRotation(ra);
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isMove = NO;

}



@end
