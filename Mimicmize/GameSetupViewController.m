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
@synthesize btn_remove_group = _btn_remove_group;
@synthesize lbl_group_explanation = _lbl_group_explanation;

@synthesize scroll_groups = _scroll_groups;
@synthesize timer_slider = _timer_slider;
@synthesize lbl_turn_timeout = _lbl_turn_timeout;
@synthesize btn_select_all = _btn_select_all;

@synthesize view_settings = _view_settings;
@synthesize view_groups = _view_groups;
@synthesize table_categorias = _table_categorias;
@synthesize array_categorias = _array_categorias;
@synthesize array_categorias_selecionadas = _array_categorias_selecionadas;

@synthesize total_groups = _total_groups;

@synthesize table_cell_nib = _table_cell_nib;
@synthesize table_cell_temp = _table_cell_temp;

-(void) calculate_show_buttons {
  
  [UIView animateWithDuration:.3 animations:^{
    
    if (self.total_groups == 2) {
      
      self.btn_remove_group.alpha =0;
    }
    else if (self.total_groups == 4) {
      
      self.btn_add_group.alpha =0;
    }
    else {
      
      self.btn_remove_group.alpha = 1;
      self.btn_add_group.alpha = 1;
    }
  }];
  
}

#pragma mark - Events

-(void) change_button_name {
  
  if ([self.array_categorias_selecionadas count] == [self.array_categorias count]) {
    self.btn_select_all.selected = YES;
    
  }
  else if ( [self.array_categorias_selecionadas count] == 0 ) {
    self.btn_select_all.selected = NO;
  }
}

-(IBAction)cancel:(id)sender {
  
  [self dismissModalViewControllerAnimated:NO];
}

-(IBAction)select_unselect_all:(id)sender {
  
  self.btn_select_all.selected = !self.btn_select_all.selected;
  if (self.btn_select_all.selected) {
     self.array_categorias_selecionadas = [[NSMutableArray alloc] initWithArray:self.array_categorias];
  }
  else {
    self.array_categorias_selecionadas = [[NSMutableArray alloc] init];
  }
  
  [self.table_categorias reloadData];
  [self change_button_name];
}

-(IBAction)change_turn_timeout:(id)sender {
  
  self.lbl_turn_timeout.text = [LocalizeHelper convert_value_to_minutes : self.timer_slider.value];
}

-(IBAction)back_to_groups:(id)sender {
  
  
  [AnimationHelper make_inverted_bounce_effect_with_view:self.view_groups bouncing_away:self.view_settings offset:0];
}

-(IBAction)add_other_group:(id)sender {
  
  [self create_new_txt_group];
}

-(IBAction)remove_last_group:(id)sender{
  
  if (self.total_groups <= 2) {
    return;
  }
  
  [self remove_last_txt_field];
  self.total_groups--;
  [self calculate_show_buttons];
}

-(void) change_views {
  
  [[HUDHelper shared_instance].main_game_controller dismiss_controllers];
  [[HUDHelper shared_instance].main_game_controller present_groups];
}

-(IBAction)done:(id)sender {
  
  [self save_settings_to_coredata];
  [self dismissModalViewControllerAnimated:YES];
  
  if ( [HUDHelper shared_instance].main_game_controller != nil ) {
    [self performSelector:@selector(change_views) withObject:nil afterDelay:.5];
  }
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
  CardsCategoryCellController *cell = (CardsCategoryCellController *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil){
    
    [self.table_cell_nib instantiateWithOwner:self options:nil];
    cell = self.table_cell_temp;
    self.table_cell_temp = nil;
  } 
  
  Categoria *categoria = [self.array_categorias objectAtIndex:indexPath.row];
  [cell set_categoria: categoria];
  if ([self.array_categorias_selecionadas containsObject:cell.categoria]) {
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  else {
    cell.accessoryType = UITableViewCellAccessoryNone;
  }
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  CardsCategoryCellController *cell = (CardsCategoryCellController*)[tableView cellForRowAtIndexPath:indexPath];
  if ([self.array_categorias_selecionadas containsObject:cell.categoria]) {
    //remove
    cell.accessoryType = UITableViewCellAccessoryNone;
    [self.array_categorias_selecionadas removeObject:cell.categoria];
  }
  else {
    //add
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [self.array_categorias_selecionadas addObject:cell.categoria];
  }
  [self change_button_name];
}

#pragma mark -

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  
  
  UITextField *next_field = (UITextField *)[self.view_groups viewWithTag:textField.tag+1];
  
  if (next_field == nil) {
    [textField resignFirstResponder];
  }
  else {
    [next_field becomeFirstResponder];
  }
  return NO;
}

-(void) remove_last_txt_field {
  
  UITextField *txt_field = (UITextField *)[self.view_groups viewWithTag:1000+self.total_groups];
  [UIView animateWithDuration:.3 animations:^{
    
    CGRect frame = txt_field.frame;
    frame.origin.x = -320;
    txt_field.frame = frame;
  } completion:^(BOOL finished) {
    
    [txt_field removeFromSuperview];
  }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  
  if (textField.tag - 1000 == self.total_groups) {
    textField.returnKeyType = UIReturnKeyDone;
  }
  else {
    textField.returnKeyType = UIReturnKeyNext;
  }
  
  if (textField.tag == 1004) {
    [self.scroll_groups setContentOffset:CGPointMake(0, 46) animated:YES];
  }
  else {
    [self.scroll_groups setContentOffset:CGPointMake(0, 0) animated:YES];
  }
  
  if (self.total_groups == 4) {
    self.scroll_groups.contentInset = UIEdgeInsetsMake(0, 0, 46, 0);
    self.scroll_groups.scrollIndicatorInsets  = UIEdgeInsetsMake(0, 0, 50, 0);
  }
  else {
    self.scroll_groups.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scroll_groups.scrollIndicatorInsets  = UIEdgeInsetsMake(0, 0, 0, 0);
  }
}

-(void)set_scroll_to_normal {
  
  self.scroll_groups.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
  self.scroll_groups.scrollIndicatorInsets  = UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
  
  if (textField.tag == 1004) {
    [self.scroll_groups setContentOffset:CGPointMake(0, 0) animated:YES];
    [self performSelector:@selector(set_scroll_to_normal) withObject:nil afterDelay:.5];
  }
}

-(UITextField *) create_txt_field {
  
  NSInteger y_atual = 10 + (40 * self.total_groups++);
  [self.scroll_groups setContentSize:CGSizeMake(320, y_atual + 40)];
  
  UITextField *txt_group = [[UITextField alloc] initWithFrame:CGRectMake(320, y_atual, 240, 32)];
  txt_group.background = [UIImage imageNamed:@"caixaTxt.png"];
  txt_group.tag = 1000 + self.total_groups;
  txt_group.delegate = self;
  txt_group.returnKeyType = UIReturnKeyNext;
  txt_group.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  txt_group.textColor = [UIColor colorWithRed:50.0/255.0 green:60.0/255.0 blue:50.0/255.0 alpha:1];
  txt_group.placeholder = [LocalizeHelper get_text_to_group_box_with_index:self.total_groups];
  txt_group.text = @"";
  
  return txt_group;
}

-(void) create_new_txt_group {
  
  UITextField *txt_group = [self create_txt_field];
  [self.scroll_groups addSubview:txt_group];
  [AnimationHelper make_bounce_effect_with_view:txt_group offset:40];
  [self calculate_show_buttons];
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

- (void)didReceiveMemoryWarning {
  
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
  
  self.array_categorias = [Categoria find_all_ordered];
  self.array_categorias_selecionadas = [[NSMutableArray alloc] initWithArray:self.array_categorias];
  
  [super viewDidLoad];
  self.btn_select_all.selected = YES;
  [self.view addSubview:self.view_groups];
  [self.view addSubview:self.view_settings];
  CGRect frame = self.view_settings.frame;
  frame.origin.x = 320;
  self.view_settings.frame = frame;
  self.table_cell_nib = [UINib nibWithNibName:@"CardsCategoryCell" bundle:nil];
  [self change_button_name];
  
  [self.timer_slider setMaximumTrackImage:[UIImage imageNamed:@"barraCheia.png"] forState:UIControlStateNormal];
  [self.timer_slider setMinimumTrackImage:[UIImage imageNamed:@"barraVazia.png"] forState:UIControlStateNormal];
  self.lbl_turn_timeout.font = [UIFont fontWithName:@"FontleroyBrown" size:32];
}

-(void) set_focus_on_first_txt {
  
  UITextField *txt_field = (UITextField *)[self.scroll_groups viewWithTag:1001];
  if (txt_field == nil) {
    return;
  }
  
  [txt_field becomeFirstResponder];
}

-(void) viewWillAppear:(BOOL)animated {
  
  [HUDHelper hide];
  [HUDHelper set_delegate:nil];
  [self performSelector:@selector(create_new_txt_group) withObject:nil afterDelay:.3];
  [self performSelector:@selector(create_new_txt_group) withObject:nil afterDelay:.5];
  [self performSelector:@selector(set_focus_on_first_txt) withObject:nil afterDelay:.65];
}

-(void) set_order_to_all_groups{
  
  NSArray *array_grupos = [Grupo findAll];
  NSInteger index =0;
  for (Grupo *grupo in array_grupos) {
    grupo.ordem = [NSNumber numberWithInt:index];
    index++;
  }
}

-(void) save_settings_to_coredata {
  
  if ( [self.array_categorias_selecionadas count] == 0) {
    self.array_categorias_selecionadas = [NSMutableArray arrayWithArray: [Categoria find_all_ordered]];
  }
  
  [Baralho set_categorias:self.array_categorias_selecionadas];
  [Grupo truncateAll];
  [Jogo truncateAll];
  [Categoria remover_categorias_do_jogo];
  
  NSInteger index_txt = 1001;
  for (; ; index_txt++) {
    UITextField *txt_field = (UITextField *)[self.view_groups viewWithTag:index_txt];
    if (txt_field == nil) {
      break;
    }
    
    Grupo *new_group = [Grupo createEntity];
    new_group.nome = [txt_field.text isEqualToString:@""] ? [NSString stringWithFormat:@"Grupo%d",index_txt-1000] : txt_field.text;
    new_group.casa_tabuleiro = [NSNumber numberWithInt:0];
  }
  
  NSInteger valor_slider = self.timer_slider.value;
  valor_slider /= 5;
  valor_slider *= 5;
  
  Jogo *new_game = [Jogo createEntity];
  new_game.segundos_rodada = [NSNumber numberWithInteger:valor_slider];
  new_game.categorias_escolhidas = [NSSet setWithArray:self.array_categorias_selecionadas];
  new_game.indice_grupo = [NSNumber numberWithInt:-1];
  [self set_order_to_all_groups];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  
  self.view_groups = nil;
  self.view_settings = nil;
  self.btn_done = nil;
  self.btn_add_group = nil;
  self.btn_remove_group = nil;
  self.scroll_groups = nil;
  self.table_categorias = nil;
  self.array_categorias = nil;
  self.array_categorias_selecionadas = nil;
  self.timer_slider = nil;
  self.lbl_turn_timeout = nil;
  self.table_cell_nib = nil;
  self.table_cell_temp = nil;
  self.btn_select_all = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
