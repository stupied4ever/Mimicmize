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

@synthesize view_settings = _view_settings;
@synthesize view_groups = _view_groups;
@synthesize table_categorias = _table_categorias;
@synthesize array_categorias = _array_categorias;

@synthesize total_groups = _total_groups;

#pragma mark - Events

-(IBAction)back_to_groups:(id)sender {
  
  
  [AnimationHelper make_inverted_bounce_effect_with_view:self.view_groups bouncing_away:self.view_settings offset:0];
}

-(IBAction)add_other_group:(id)sender {
  
  [self create_new_txt_group];
}

-(IBAction)done:(id)sender {
  
  [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)next:(id)sender {
  
  [AnimationHelper make_bounce_effect_with_view:self.view_settings bouncing_away:self.view_groups offset:0];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.array_categorias count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"categoria_cell";
  UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil){
    
    cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.table_categorias.frame.size.width, 44)];
  } 
  
  // cell.imagem_post
  Categoria *categoria = [self.array_categorias objectAtIndex:indexPath.row];
  cell.textLabel.text = [categoria get_localized_attributes].nome;
  
  return cell;
  
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  //cell.backgroundColor = ((ApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  /*[tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  Post *post = [self.array_post objectAtIndex:indexPath.row];
  NewsDetalheController_iPhone *detalhe = [NewsDetalheController_iPhone newsDetalheWithPost:post];
  self.hidesBottomBarWhenPushed = TRUE;
  detalhe.navigationItem.rightBarButtonItem = self.navigationItem.rightBarButtonItem;
  [self.navigationController pushViewController:detalhe animated:TRUE];*/
}

#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  [textField resignFirstResponder];
  return NO;
}

-(UITextField *) create_txt_field {
  
  NSInteger y_atual = 10 + (40 * self.total_groups++);
  [self.scroll_groups setContentSize:CGSizeMake(320, y_atual + 40)];
  
  UITextField *txt_group = [[UITextField alloc] initWithFrame:CGRectMake(320, y_atual, 240, 32)];
  txt_group.tag = 1000 + self.total_groups;
  txt_group.delegate = self;
  txt_group.backgroundColor = [UIColor greenColor];
  return txt_group;
}

-(void) create_new_txt_group {
  
  UITextField *txt_group = [self create_txt_field];
  [self.scroll_groups addSubview:txt_group];
  [AnimationHelper make_bounce_effect_with_view:txt_group offset:20];
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

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view addSubview:self.view_groups];
  [self.view addSubview:self.view_settings];
  CGRect frame = self.view_settings.frame;
  frame.origin.x = 320;
  self.view_settings.frame = frame;
  self.array_categorias = [Categoria findAll];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  
  self.view_groups = nil;
  self.view_settings = nil;
  self.btn_done = nil;
  self.btn_add_group = nil;
  self.scroll_groups = nil;
  self.table_categorias = nil;
  self.array_categorias = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
