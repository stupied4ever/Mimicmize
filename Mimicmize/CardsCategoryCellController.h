//
//  CardsCategoryCellController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriaModel.h"

@interface CardsCategoryCellController : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *lbl_category_name;
@property (nonatomic, strong) IBOutlet UIImageView *img_checked;
@property (nonatomic, strong) Categoria *categoria;

-(void) set_categoria : (Categoria *)categoria;

@end
