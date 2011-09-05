//
//  BoardPlaceViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoardPlaceViewController.h"

@implementation BoardPlaceViewController

@synthesize carta_01 = _carta_01;
@synthesize carta_02 = _carta_02;
@synthesize carta_03 = _carta_03;
@synthesize carta_04 = _carta_04;
@synthesize cards_choice_controller = _cards_choice_controller;

@synthesize img_1 = _img_1;
@synthesize img_2 = _img_2;
@synthesize img_3 = _img_3;
@synthesize img_go = _img_go;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) prepare_layout_for_animation {
  UILabel *lbl_number = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 70)];
  
  self.img_1.backgroundColor = [UIColor redColor];
  
  lbl_number = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 70)];
  lbl_number.text = @"1";
  [self.img_1 addSubview:lbl_number];
  
  self.img_2.backgroundColor = [UIColor greenColor];
  lbl_number = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 70)];
  lbl_number.text = @"2";
  [self.img_2 addSubview:lbl_number];
  
  self.img_3.backgroundColor = [UIColor blueColor];
  lbl_number = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 70)];
  lbl_number.text = @"3";
  [self.img_3 addSubview:lbl_number];
  
  self.img_go.backgroundColor = [UIColor yellowColor];
  lbl_number = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 100, 70)];
  lbl_number.text = @"GO";
  [self.img_go addSubview:lbl_number];
}

-(void) prepare_animations_to_change {
  
  [UIView animateWithDuration:1 animations:^{
    self.img_2.alpha = 1;
    self.img_3.alpha = 0;
  }completion:^(BOOL finished) {
    [UIView animateWithDuration:1 animations:^{
      self.img_1.alpha = 1;
      self.img_2.alpha = 0;
    }completion:^(BOOL finished) {
      [UIView animateWithDuration:1 animations:^{
        self.img_go.alpha = 1;
        self.img_1.alpha = 0;
      }];
    }];
  }];
}

-(void) card_selected {
  
  [self prepare_layout_for_animation];
  
  UIButton *btn_selected = (UIButton *)[self.view viewWithTag:12345];
  [UIView animateWithDuration:.3 animations:^{
    btn_selected.alpha = 0;
    self.img_3.alpha = 1;
  }completion:^(BOOL finished) {
    [self prepare_animations_to_change];
  }];
}

- (UIView *) get_view_opcoes {
  
  self.cards_choice_controller = [[CardsChoiceViewController alloc] initWithNibName:@"CardChoiceView" bundle:nil];
  self.cards_choice_controller.delegate = self;
  UIView *return_view = self.cards_choice_controller.view;
  [self.cards_choice_controller set_carta:[Baralho pick_card] na_posicao:1];
  [self.cards_choice_controller set_carta:[Baralho pick_card] na_posicao:2];
  [self.cards_choice_controller set_carta:[Baralho pick_card] na_posicao:3];
  return return_view;
}

#pragma mark - Events

-(IBAction)select_card:(id)sender {
  
  UIButton *btn_selected = (UIButton *)sender;
  CGRect frame_carta01 = CGRectMake(-110, 335, 100, 120);
  CGRect frame_carta02 = CGRectMake(-80, 480, 100, 120);
  CGRect frame_carta03 = CGRectMake(150, 480, 100, 120);
  CGRect frame_carta04 = CGRectMake(345, 335, 100, 120);
  [btn_selected addSubview:[self get_view_opcoes]];
  [UIView animateWithDuration:.7 animations:^{
    
    if (self.carta_01 != btn_selected) {
      self.carta_01.frame = frame_carta01;
      self.carta_01.transform = CGAffineTransformMakeRotation(-M_PI/8);
    }
    
    if (self.carta_02 != btn_selected) {
      self.carta_02.frame = frame_carta02;
      self.carta_02.transform = CGAffineTransformMakeRotation(-M_PI/16);
    }
    
    if (self.carta_03 != btn_selected) {
      self.carta_03.frame = frame_carta03;
      self.carta_03.transform = CGAffineTransformMakeRotation(M_PI/16);
    }
    
    if (self.carta_04 != btn_selected) {
      self.carta_04.frame = frame_carta04;
      self.carta_04.transform = CGAffineTransformMakeRotation(M_PI/8);
    }
    
    btn_selected.transform = CGAffineTransformMakeRotation(0);
    CGRect frame = self.carta_01.frame;
    frame.origin.x = 50;
    frame.origin.y = 248;
    frame.size.width = 220;
    frame.size.height = 190;
    btn_selected.frame = frame;
    btn_selected.tag = 12345;
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:btn_selected cache:NO];
    
  }];
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) animate_cards {
  
  CGRect center_frame = CGRectMake(110, 400, 100, 120);
  CGRect frame_carta01 = CGRectMake(5, 340, 100, 120);
  CGRect frame_carta02 = CGRectMake(75, 320, 100, 120);
  CGRect frame_carta03 = CGRectMake(145, 320, 100, 120);
  CGRect frame_carta04 = CGRectMake(215, 340, 100, 120);
  self.carta_01.frame = center_frame;
  self.carta_02.frame = center_frame;
  self.carta_03.frame = center_frame;
  self.carta_04.frame = center_frame;
  [UIView animateWithDuration:.7 animations:^{
    
    self.carta_01.frame = frame_carta01;
    self.carta_01.transform = CGAffineTransformMakeRotation(-M_PI/8);
    self.carta_02.frame = frame_carta02;
    self.carta_02.transform = CGAffineTransformMakeRotation(-M_PI/16);
    self.carta_03.frame = frame_carta03;
    self.carta_03.transform = CGAffineTransformMakeRotation(M_PI/16);
    self.carta_04.frame = frame_carta04;
    self.carta_04.transform = CGAffineTransformMakeRotation(M_PI/8);
  }];
}

-(void) viewDidAppear:(BOOL)animated {
  
  [self animate_cards];
}


- (void)viewDidUnload
{
  [super viewDidUnload];
  self.carta_01 = nil;
  self.carta_02 = nil;
  self.carta_03 = nil;
  self.carta_04 = nil;
  self.cards_choice_controller = nil;
  
  self.img_1 = nil;
  self.img_2 = nil;
  self.img_3 = nil;
  self.img_go = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
