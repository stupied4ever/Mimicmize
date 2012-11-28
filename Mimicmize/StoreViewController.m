//
//  StoreViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 11/25/12.
//
//

#import "StoreViewController.h"

@interface StoreViewController ()

@property (nonatomic, strong) NSMutableArray *array_comprados;
@property (nonatomic, strong) NSMutableArray *array_nao_comprados;
@property (nonatomic, strong) Bundle *bundle_selected;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) SKProductsRequest *productsRequest;
@property (nonatomic, strong) SKProduct *product_bundle;

@end

@implementation StoreViewController

#pragma mark - StoreKit 

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
  NSArray *products = response.products;
  NSArray *invalid_products = response.invalidProductIdentifiers;
  if ([invalid_products count] > 0 ) {
    
    NSLog(@"Invalid products: %@", invalid_products);
    [SVProgressHUD showErrorWithStatus:@"Erro ao processar"];
    return;
  }
  
  self.product_bundle = [products objectAtIndex:0];
  [self charge_for_bundle];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
  for (SKPaymentTransaction *transaction in transactions)
  {
    switch (transaction.transactionState)
    {
      case SKPaymentTransactionStatePurchased:
        [self success:transaction];
        break;
      case SKPaymentTransactionStateFailed:
        [self failed:transaction];
        break;
      case SKPaymentTransactionStateRestored:
        [self restore:transaction];
        break;
      default:
        break;
    }
  }
}

-(void) failed : (SKPaymentTransaction *)transaction {
  
  [SVProgressHUD showErrorWithStatus:@"Cancelado"];
  NSLog(@"Erro: %@",transaction.error);
  NSLog(@"UserInfo: %@",transaction.error.userInfo);
  [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

-(void) restore : (SKPaymentTransaction *)transaction {
  
  [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
  
  Bundle *bundle = [Bundle findFirstByAttribute:@"inapp_id" withValue:transaction.payment.productIdentifier];
  bundle.comprado = [NSNumber numberWithBool:YES];
  [[NSManagedObjectContext defaultContext]save];
  
  [self reload_table_info:YES];
}

-(void) success : (SKPaymentTransaction *)transaction {
  
  [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
  
  Bundle *bundle = [Bundle findFirstByAttribute:@"inapp_id" withValue:transaction.payment.productIdentifier];
  bundle.comprado = [NSNumber numberWithBool:YES];
  [SVProgressHUD showSuccessWithStatus:@"Comprado!"];
  
  NSInteger bundle_row = [self.array_nao_comprados indexOfObject:self.bundle_selected];
  [self.array_nao_comprados removeObject:self.bundle_selected];
  
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:bundle_row inSection:1];
  [self.table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
  
  [self.array_comprados insertObject:self.bundle_selected atIndex:0];
  indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.table insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
  
  [[NSManagedObjectContext defaultContext]save];
}

-(void) charge_for_bundle {
  
  SKPayment *payment = [SKPayment paymentWithProduct:self.product_bundle];
  [[SKPaymentQueue defaultQueue] addPayment:payment];
}

#pragma mark - UIAlertView

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  
  if (buttonIndex == 0) {
    return;
  }
  
  [self charge_for_bundle];
}

#pragma mark - Tableview

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
  
  return 2;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
  if (section == 0) {
    
    return [LocalizeHelper get_compradas_string];
  }
  
  return [LocalizeHelper get_nao_compradas_string];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  if (section == 0) {
    return [self.array_comprados count];
  }
  
  return [self.array_nao_comprados count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"store_cell";
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] init];
  }
  
  NSArray *array_use = nil;
  if (indexPath.section == 0) {
    
    array_use = self.array_comprados;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
  }
  else {
    array_use = self.array_nao_comprados;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
    
  Bundle *bundle = [array_use objectAtIndex:indexPath.row];
  Bundle_Localize *localized = [bundle get_localized_attributes];
  cell.textLabel.text = localized.nome;
  return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
  
  if (indexPath.section == 0) {
    return;
  }
  
  NSArray *array_use = self.array_nao_comprados;
  Bundle *bundle = [array_use objectAtIndex:indexPath.row];
  self.bundle_selected = bundle;
  
  if ([SKPaymentQueue canMakePayments]) {
    [SVProgressHUD showWithStatus:@"Processando..." maskType:SVProgressHUDMaskTypeGradient];
    NSSet *productIdentifiers = [NSSet setWithObject:self.bundle_selected.inapp_id];
    self.productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    self.productsRequest.delegate = self;
    [self.productsRequest start];
  }
  else {
    [SVProgressHUD showErrorWithStatus:@"Parental control is enabled"];
  }
}

-(void) reload_table_info:(BOOL) should_reload_table {
  
  self.array_comprados = [NSMutableArray arrayWithArray: [Bundle findByAttribute:@"comprado" withValue:[NSNumber numberWithBool:YES]] ]; //andOrderBy:@"nome" ascending:YES];
  self.array_nao_comprados = [NSMutableArray arrayWithArray: [Bundle findByAttribute:@"comprado" withValue:[NSNumber numberWithBool:NO]] ];// andOrderBy:@"nome" ascending:YES];
  
  if (should_reload_table) {
    
    [self.table reloadData];
  }
}

-(void) dismiss {
  
  [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
  [self reload_table_info:NO];
  
  self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated {
  
  //[[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)viewDidUnload {
  
  [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
  [self setTable:nil];
  [super viewDidUnload];
}
@end
