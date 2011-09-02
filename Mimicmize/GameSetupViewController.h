//
//  GameSetupViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationHelper.h"
#import "CategoriaModel.h"
#import "CardsCategoryCellController.h"

@interface GameSetupViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIButton *btn_add_group;
@property (nonatomic, strong) IBOutlet UIButton *btn_done;
@property (nonatomic, strong) IBOutlet UIScrollView *scroll_groups;

//view config
@property (nonatomic, strong) IBOutlet UIView *view_groups;
@property (nonatomic, strong) IBOutlet UIView *view_settings;
@property (nonatomic, strong) IBOutlet UITableView *table_categorias;
@property (nonatomic, strong) IBOutlet UIButton *btn_select_all;

@property (nonatomic, strong) IBOutlet UISlider *timer_slider;
@property (nonatomic, strong) IBOutlet UILabel *lbl_turn_timeout;

@property (nonatomic) NSInteger total_groups;
@property (nonatomic, strong) NSArray *array_categorias;
@property (nonatomic, strong) NSMutableArray *array_categorias_selecionadas;

@property (nonatomic, strong) IBOutlet UINib *table_cell_nib;
@property (nonatomic, strong) IBOutlet CardsCategoryCellController *table_cell_temp;


-(IBAction)back_to_groups:(id)sender;
-(IBAction)add_other_group:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)change_turn_timeout:(id)sender;
-(IBAction)select_unselect_all:(id)sender;

-(void) create_new_txt_group;

@end
