//
//  EditImageView.h
//  WaterMarkDemo
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditImageView : UIImageView{
    BOOL _isMove;
    CGPoint _startTouchPoint;
    CGPoint _startTouchCenter;
    UIView *_borderView;
    UIImageView *_editImgView;
    UIButton *_closeImgView;
    CGFloat _len;
}

- (void)hideEditBtn;




@end
