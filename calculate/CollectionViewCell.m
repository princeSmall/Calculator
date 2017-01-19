//
//  CollectionViewCell.m
//  calculate
//
//  Created by tongle on 2017/1/17.
//  Copyright © 2017年 tongle. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(void)addUI{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.Label= [[UILabel alloc]initWithFrame:self.bounds];
    
    self.Label.textColor = [UIColor blackColor];
    self.Label.font = [UIFont fontWithName:@"Arial" size:24];
    self.Label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.Label];

}
@end
