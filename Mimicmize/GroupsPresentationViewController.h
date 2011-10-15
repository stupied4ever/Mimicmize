//
//  GroupsPresentationViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GrupoModel.h"
#import "HUDHelper.h"

@class BoardPlaceViewController;
@interface GroupsPresentationViewController : UIViewController<PausableUI>

@property (nonatomic, strong) IBOutlet UIImageView *img_boneco01;
@property (nonatomic, strong) IBOutlet UIImageView *img_boneco02;
@property (nonatomic, strong) IBOutlet UIImageView *img_boneco03;
@property (nonatomic, strong) IBOutlet UIImageView *img_boneco04;
@property (nonatomic, strong) IBOutlet UILabel *lbl_group_name;

@property (nonatomic, strong) NSArray *array_grupos;
@property (nonatomic, assign) NSInteger total_grupos;
@property (nonatomic, assign) NSInteger index_group_show;
@property (nonatomic, assign) NSInteger index_animation;

@property (nonatomic, assign) BoardPlaceViewController *delegate;

-(void) start_animation;
-(void) present_board;

@end
