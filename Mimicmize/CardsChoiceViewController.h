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

@protocol CardsChoiceDelegate

-(void) card_selected : (Carta *) card;

@end

@interface CardsChoiceViewController : UIViewController

@property (nonatomic, strong) Carta *carta_01;
@property (nonatomic, strong) Carta *carta_02;
@property (nonatomic, strong) Carta *carta_03;

@property (nonatomic, strong) IBOutlet UIButton *btn_carta_01;
@property (nonatomic, strong) IBOutlet UIButton *btn_carta_02;
@property (nonatomic, strong) IBOutlet UIButton *btn_carta_03;

@property (nonatomic, assign) id<CardsChoiceDelegate> delegate;

-(void) set_carta : (Carta *) carta na_posicao: (NSInteger) posicao;
-(IBAction)select_carta:(id)sender;

@end
