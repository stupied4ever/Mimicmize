//
//  BoardMoveViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUDHelper.h"
#import "GrupoModel.h"

@class BoardPlaceViewController;
@interface BoardMoveViewController : UIViewController<PausableUI> {
  
  BoardPlaceViewController *delegate;
}

-(void) set_delegate : (BoardPlaceViewController *)p_delegate;

@property (nonatomic, assign) NSInteger qtd_casas_andar;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_grupo1;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_grupo2;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_grupo3;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_grupo4;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_pontos_grupo1;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_pontos_grupo2;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_pontos_grupo3;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_pontos_grupo4;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *img_grupo;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *img_next_grupo;

@end
