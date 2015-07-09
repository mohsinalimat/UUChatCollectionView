//
//  UUChatCollectionViewCellOutgoing.m
//  UUChatCollectionView
//
//  Created by zhangyu on 15/7/5.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUChatCollectionViewCellOutgoing.h"
#import "Chat-Import.h"
#import "Chat-Macros.h"

@interface UUChatCollectionViewCellOutgoing(){

    CGFloat Offset;
}

@end

@implementation UUChatCollectionViewCellOutgoing

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self configUI];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
        
    }
    return self;
}

#pragma mark - life cycle

- (void)configUI{
    
    [super configUI];
    
    self.lblUserName.textAlignment = NSTextAlignmentRight;
    
    UIImage* img=[UIImage imageNamed:@"bg_bubble_m_nor"];//原图
    UIEdgeInsets edge=UIEdgeInsetsMake(15, 10, 15 ,15);
    
    self.imgBubble.image= [img resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
}

- (void)updateConstraints{
    
    if (!self.didSetupConstraints) {
        
        [self.timeStampView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_lessThanOrEqualTo(@20);
            make.top.equalTo(self.contentView);
            make.centerX.equalTo(self.contentView);
        }];
        
        [self.imgUserAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(kUserAvatarSize);
            make.top.equalTo(self.timeStampView.mas_bottom).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        [self.lblUserName mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(@20).priorityHigh();
            make.top.equalTo(self.imgUserAvatar);
            make.right.equalTo(self.imgUserAvatar.mas_left).offset(-10);
            
        }];
        
        [self.imgBubble mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.lblUserName.mas_bottom).offset(0);
            make.right.equalTo(self.imgUserAvatar.mas_left).offset(-5);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        }];
        
        [self.lblMessage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.equalTo(self.imgBubble).with.insets(self.chatMessageOutgoingInsets);
        }];
        
        self.didSetupConstraints = YES;
    }
    
    [self.timeStampView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(Offset);
    }];
    
    [self.imgUserAvatar mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.timeStampView.mas_bottom).offset(Offset == 0 ? 10 :20);
    }];
    
    [super updateConstraints];
}

#pragma mark - Delegate

#pragma mark - Custom Deledate

#pragma mark - Event Response

#pragma mark - Public Methods

- (void)setContentWithObject:(UUChatMessage *)obj indexPath:(NSInteger )index{
    
    if (index % 5 == 0) {
    
        [self.timeStampView setContent:obj.timestamp];
        Offset = kTimeStempOffsetTop;
        
    }else{
    
        [self.timeStampView setContent:@""];
        Offset = 0;
    }

    
    self.lblUserName.text = obj.userName;
    self.imgUserAvatar.image = [UIImage imageNamed:obj.userAvatar];
    
    self.lblMessage.text = obj.message;
    
    UIImage* img=[UIImage imageNamed:@"bg_bubble_m_nor"];//原图
    UIEdgeInsets edge=UIEdgeInsetsMake(15, 10, 15 ,15);
    
    self.imgBubble.image= [img resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
}

#pragma mark - Private Methods

#pragma mark - Getters And Setters

@end
