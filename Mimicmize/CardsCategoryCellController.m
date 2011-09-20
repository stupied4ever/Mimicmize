//
//  CardsCategoryCellController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CardsCategoryCellController.h"

@implementation CardsCategoryCellController

@synthesize lbl_category_name = _lbl_category_name;
@synthesize img_checked = _img_checked;
@synthesize categoria = _categoria;

-(void) set_categoria : (Categoria *)categoria {
  
  self.categoria = categoria;
  self.lbl_category_name.text = [self.categoria get_localized_attributes].nome;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  // Configure the view for the selected state
}

@end
