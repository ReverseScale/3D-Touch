//
//  PicCollectionViewCell.m
//  Touch
//
//  Created by Steven on 15/12/4.
//  Copyright © 2015年 Steven. All rights reserved.
//


#import "PicCollectionViewCell.h"

@interface PicCollectionViewCell ()

@property (nonatomic, strong) UIImageView *image;

@end

@implementation PicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.image = [[UIImageView alloc] init];
        [self.contentView addSubview:self.image];
        
        
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    self.image.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    
    
}

- (void)setName:(NSString *)name {
    _name = name;
    self.image.image = [UIImage imageNamed:self.name];
    
    
}


@end
