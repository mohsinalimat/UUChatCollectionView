//
//  UUChatCollectionViewCell.h
//  UUChatCollectionView
//
//  Created by zhangyu on 15/7/5.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kUserAvatarSize CGSizeMake(40,40)
#define kTimeStempOffsetTop  35

@class UUChatMessage, UUChatTimeStampView;
@interface UUChatCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, getter = getImageUserAvatar) UIImageView *imgUserAvatar;
@property (nonatomic, strong, getter = getImageBubble) UIImageView *imgBubble;
@property (nonatomic, strong, getter = getTimestampView) UUChatTimeStampView *timeStampView;
@property (nonatomic, strong, getter = getLabelUserName) UILabel *lblUserName;
@property (nonatomic, strong, getter = getLabelMessage) UILabel *lblMessage;

@property (nonatomic, assign) BOOL didSetupConstraints;

@property (nonatomic, assign) UIEdgeInsets timeStampInsets;

- (void)configUI;
- (void)setContentWithObject:(UUChatMessage *)obj indexPath:(NSInteger )index;

+ (NSString *)cellReuseIdentifier;
+ (CGFloat)maxBubboleWidth;

@end
