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
  [delegate walk_group];
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

-(void) viewDidAppear:(BOOL)animated {
  
  [HUDHelper set_delegate:self];
}

#pragma mark - Pausable Protocol

-(void) pause {
  
}

-(void) resume {
  
}

@end
