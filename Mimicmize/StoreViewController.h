//
//  StoreViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 11/25/12.
//
//

#import <UIKit/UIKit.h>
#import "LocalizeHelper.h"
#import "BundleModel.h"
#import "SVProgressHUD.h"
#import <StoreKit/StoreKit.h>

@interface StoreViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate,SKPaymentTransactionObserver,SKProductsRequestDelegate>

@end
