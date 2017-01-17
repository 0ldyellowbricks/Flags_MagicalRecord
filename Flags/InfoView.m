//
//  InfoView.m
//  Flags
//
//  Created by Frayda on 16/1/17.
//  Copyright © 2017 flas. All rights reserved.
//

#import "InfoView.h"
#import <Masonry/Masonry.h>

@implementation InfoView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.finishBtn = [UIButton new];
        [self addSubview:self.finishBtn];
        [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.equalTo(self).offset(-40);
            make.top.equalTo(@50);
            make.height.equalTo(@40);
        }];
        [self.finishBtn setTitle:@"确  定" forState:UIControlStateNormal];
        self.finishBtn.backgroundColor = [UIColor lightGrayColor];
        [self.finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.nameTF = [UITextField new];
        [self addSubview:self.nameTF];
        [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.equalTo(self).offset(-40);
            make.top.equalTo(self.finishBtn.mas_bottom).offset(40);
            make.height.equalTo(@20);
        }];
        self.nameTF.layer.borderWidth = .5;
        self.nameTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.nameTF.placeholder = @"country name of the flag";
        self.nameTF.font = [UIFont systemFontOfSize:15];
        self.nameTF.textAlignment = NSTextAlignmentCenter;
        self.countTF = [UITextField new];
        [self addSubview:self.countTF];
        [self.countTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.equalTo(self).offset(-40);
            make.top.equalTo(self.nameTF.mas_bottom).offset(40);
            make.height.equalTo(@20);
        }];
        self.countTF.layer.borderWidth = .5;
        self.countTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.countTF.placeholder = @"travel times of this country";
        self.countTF.font = [UIFont systemFontOfSize:15];
        self.countTF.textAlignment = NSTextAlignmentCenter;
        self.countTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self;
}

@end
