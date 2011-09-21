//
//  BoardMoveViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoardMoveViewController.h"
#import "BoardPlaceViewController.h"

@implementation BoardMoveViewController

-(void) dismiss {
  
  [self dismissModalViewControllerAnimated:NO];
  [delegate next_group];
}

-(void) set_delegate : (BoardPlaceViewController *)p_delegate {
  
  delegate = p_delegate;
}

-(void) viewDidLoad {
  
  BoardMoveView *view = (BoardMoveView *)self.view;
  [view start_animation];
  [self performSelector:@selector(dismiss) withObject:nil afterDelay:4];
}

@end
