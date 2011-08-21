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

@interface GameSetupViewController : UIViewController<UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UIButton *btn_add_group;
@property (nonatomic, strong) IBOutlet UIButton *btn_done;
@property (nonatomic, strong) IBOutlet UIScrollView *scroll_groups;

//view config
@property (nonatomic, strong) IBOutlet UIView *view_groups;
@property (nonatomic, strong) IBOutlet UIView *view_settings;
@property (nonatomic, strong) IBOutlet UITableView *table_categorias;

@property (nonatomic) NSInteger total_groups;
@property (nonatomic, strong) NSArray *array_categorias;

-(IBAction)back_to_groups:(id)sender;
-(IBAction)add_other_group:(id)sender;
-(IBAction)done:(id)sender;
-(IBAction)next:(id)sender;

-(void) create_new_txt_group;

@end
