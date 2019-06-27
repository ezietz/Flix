//
//  MovieCell.m
//  Flix
//
//  Created by ezietz on 6/26/19.
//  Copyright © 2019 ezietz. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor colorWithRed:180/255.0
                                                     green:138/255.0
                                                      blue:170/255.0
                                                     alpha:0.3];
    self.selectedBackgroundView = backgroundView;
    //self.selectionStyle = UITableViewCellSelectionStyleNone;

    // Configure the view for the selected state
}

@end
