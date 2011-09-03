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

#pragma mark - Events

-(IBAction)select_card:(id)sender {
  
  UIButton *btn_selected = (UIButton *)sender;
  CGRect frame_carta01 = CGRectMake(-110, 335, 100, 120);
  CGRect frame_carta02 = CGRectMake(-80, 480, 100, 120);
  CGRect frame_carta03 = CGRectMake(150, 480, 100, 120);
  CGRect frame_carta04 = CGRectMake(345, 335, 100, 120);
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
  CGRect frame_carta01 = CGRectMake(10, 335, 100, 120);
  CGRect frame_carta02 = CGRectMake(80, 320, 100, 120);
  CGRect frame_carta03 = CGRectMake(150, 320, 100, 120);
  CGRect frame_carta04 = CGRectMake(210, 335, 100, 120);
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
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
