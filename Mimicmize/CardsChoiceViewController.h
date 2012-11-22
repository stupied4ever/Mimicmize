//
//  CardsChoiceViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartaModel.h"
#import "Baralho.h"
#import "JogoModel.h"
#import <QuartzCore/QuartzCore.h>

@protocol CardsChoiceDelegate

-(void) card_selected : (Carta *) card;

@end

@interface CardsChoiceViewController : UIViewController

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lbl_titulo;
@property (nonatomic, strong) Carta *carta_01;
@property (nonatomic, strong) Carta *carta_02;
@property (nonatomic, strong) Carta *carta_03;

@property (nonatomic, strong) IBOutlet UIButton *btn_carta_01;
@property (nonatomic, strong) IBOutlet UIButton *btn_carta_02;
@property (nonatomic, strong) IBOutlet UIButton *btn_carta_03;

@property (nonatomic, assign) id<CardsChoiceDelegate> delegate;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *btn_start;

-(void) set_carta : (Carta *) carta na_posicao: (NSInteger) posicao;
-(IBAction)select_carta:(id)sender;

@end
