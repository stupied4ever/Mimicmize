//
//  GameSetupViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameSetupViewController.h"

@implementation GameSetupViewController

@synthesize btn_done = _btn_done;
@synthesize btn_add_group = _btn_add_group;
@synthesize scroll_groups = _scroll_groups;

@synthesize total_groups = _total_groups;

#pragma mark - Events

-(IBAction)add_other_group:(id)sender {
  
  [self create_new_txt_group];
}

-(IBAction)done:(id)sender {
  
}

#pragma mark -

-(void) create_new_txt_group {
  
  NSInteger y_atual = 10 + (40 * self.total_groups);
  self.total_groups++;
  [self.scroll_groups setContentSize:CGSizeMake(320, y_atual + 40)];
  
  UITextField *txt_group = [[UITextField alloc] initWithFrame:CGRectMake(320, y_atual, 240, 32)];
  txt_group.tag = 1000;
  txt_group.backgroundColor = [UIColor greenColor];

  
  [self.scroll_groups addSubview:txt_group];
  
  [UIView animateWithDuration:.4 delay:0 options:UIViewAnimationCurveEaseIn
     animations:^{ 
       CGRect frame = txt_group.frame;
       frame.origin.x = -20;
       txt_group.frame = frame;
     } 
    completion:^(BOOL finished){
      
      [UIView animateWithDuration:.2 animations:^{
        CGRect frame = txt_group.frame;
        frame.origin.x = 20;
        txt_group.frame = frame; 
      }];
      
    }];
  
}

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.total_groups = 0;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
