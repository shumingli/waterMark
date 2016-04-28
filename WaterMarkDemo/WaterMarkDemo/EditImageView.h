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
    UIImageView *_editImgView;
    UIImageView *_closeImgView;
    CGFloat _len;
}

@end
