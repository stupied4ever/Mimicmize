//
//  GameSetupViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSetupViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *btn_add_group;
@property (nonatomic, strong) IBOutlet UIButton *btn_done;
@property (nonatomic, strong) IBOutlet UIScrollView *scroll_groups;

@property (nonatomic) NSInteger total_groups;

-(IBAction)add_other_group:(id)sender;
-(IBAction)done:(id)sender;

-(void) create_new_txt_group;

@end
