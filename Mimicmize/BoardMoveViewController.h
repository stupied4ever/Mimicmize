//
//  BoardMoveViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardMoveView.h"

@class BoardPlaceViewController;
@interface BoardMoveViewController : UIViewController {
  
  BoardPlaceViewController *delegate;
}

-(void) set_delegate : (BoardPlaceViewController *)p_delegate;

@end
