//
//  BoardMoveView.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoardMoveView : UIView {
  CGFloat x_atual;
  CGFloat y_atual;
  
  NSInteger casa_atual;
}

-(void) start_animation;

@end
