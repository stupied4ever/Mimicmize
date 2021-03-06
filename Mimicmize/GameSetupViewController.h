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
#import "JogoModel.h"
#import "GrupoModel.h"
#import "Baralho.h"
#import "HUDHelper.h"
#import "BoardPlaceViewController.h"
#import "NSMutableArray+Helper.h"
#import "StoreViewController.h"

@interface GameSetupViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIButton *btn_add_group;
@property (nonatomic, strong) IBOutlet UIButton *btn_remove_group;
@property (nonatomic, strong) IBOutlet UIButton *btn_done;
@property (nonatomic, strong) IBOutlet UIScrollView *scroll_groups;
@property (nonatomic, strong) IBOutlet UILabel *lbl_group_explanation;
@property (weak, nonatomic) IBOutlet UILabel *lbl_pontos;
@property (weak, nonatomic) IBOutlet UISlider *slider_pontos;


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

@property (nonatomic, assign) BOOL will_return_from_store;
@property (weak, nonatomic) IBOutlet UIView *view_comprar;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll_comprar;
@property (weak, nonatomic) IBOutlet UILabel *lbl_comprar;


-(IBAction)back_to_groups:(id)sender;
-(IBAction)add_other_group:(id)sender;
-(IBAction)remove_last_group:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)next:(id)sender;
-(IBAction)change_turn_timeout:(id)sender;
-(IBAction)select_unselect_all:(id)sender;
-(IBAction)cancel:(id)sender;
-(IBAction)open_store:(id)sender;

-(void) create_new_txt_group;
-(void) remove_last_txt_field;
-(void) save_settings_to_coredata;

@end
