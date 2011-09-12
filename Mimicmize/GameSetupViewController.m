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

#pragma mark - Events

-(void) change_button_name {
  self.btn_select_all.selected = NO;
  if ([self.array_categorias_selecionadas count] == [self.array_categorias count]) {
    [self.btn_select_all setTitle:@"Disable All" forState:UIControlStateNormal];
    
  }
  else if ( [self.array_categorias_selecionadas count] == 0 ) {
    [self.btn_select_all setTitle:@"Enable All" forState:UIControlStateNormal]  ;
  }
}

-(IBAction)select_unselect_all:(id)sender {
  
  if ([self.array_categorias_selecionadas count] == [self.array_categorias count]) {
    self.array_categorias_selecionadas = [[NSMutableArray alloc] init];
  }
  else {
    self.array_categorias_selecionadas = [[NSMutableArray alloc] initWithArray:self.array_categorias];
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

-(IBAction)done:(id)sender {
  
  [self save_settings_to_coredata];
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
  CardsCategoryCellController *cell = (CardsCategoryCellController *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil){
    
    [self.table_cell_nib instantiateWithOwner:self options:nil];
    cell = self.table_cell_temp;
    self.table_cell_temp = nil;
  } 
  
  // cell.imagem_post
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

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
  //cell.backgroundColor = ((ApplicationCell *)cell).useDarkBackground ? DARK_BACKGROUND : LIGHT_BACKGROUND;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
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
  
  self.array_categorias = [Categoria find_all_ordered];
  self.array_categorias_selecionadas = [[NSMutableArray alloc] initWithArray:self.array_categorias];
  
  [super viewDidLoad];
  [self.view addSubview:self.view_groups];
  [self.view addSubview:self.view_settings];
  CGRect frame = self.view_settings.frame;
  frame.origin.x = 320;
  self.view_settings.frame = frame;
  self.table_cell_nib = [UINib nibWithNibName:@"CardsCategoryCell" bundle:nil];
  [self change_button_name];
  
  
}

-(void) set_focus_on_first_txt {
  
  UITextField *txt_field = (UITextField *)[self.scroll_groups viewWithTag:1001];
  if (txt_field == nil) {
    return;
  }
  
  [txt_field becomeFirstResponder];
}

-(void) viewWillAppear:(BOOL)animated {
  
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
    new_group.nome = txt_field.text;
    new_group.casa_tabuleiro = [NSNumber numberWithInt:0];
  }
  
  Jogo *new_game = [Jogo createEntity];
  new_game.segundos_rodada = [NSNumber numberWithFloat:self.timer_slider.value];
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
