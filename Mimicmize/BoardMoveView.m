//
//  BoardMoveView.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoardMoveView.h"

@implementation BoardMoveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}

- (void)drawTabuleiro : (CGContextRef) ctx {
  
  CGFloat x_desenho = 10;
  CGFloat y_desenho = 440;
  CGFloat move_x = 10;
  CGFloat move_y = -10;
  
  CGContextSetRGBStrokeColor(ctx, 0.4, 0.4, 0.4, 1); 
  CGContextBeginPath(ctx);
  
  NSInteger i =0;
  
  while (i < 11) {
    
    NSInteger j=0;
    while (j < 15) {
      CGContextMoveToPoint(ctx, x_desenho += move_x, y_desenho);
      CGContextAddLineToPoint( ctx, x_desenho += move_x, y_desenho);
      j+=1;
    }
    move_x *= -1;
    CGContextMoveToPoint(ctx, x_desenho, y_desenho+=move_y);
    CGContextAddLineToPoint( ctx, x_desenho, y_desenho+=move_y);
    CGContextMoveToPoint(ctx, x_desenho, y_desenho+=move_y);
    CGContextAddLineToPoint( ctx, x_desenho, y_desenho+=move_y);
    i+=1;
  }
  CGContextStrokePath(ctx);
  
}

- (void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  
  
  CGFloat x_desenho = 10;
  CGFloat y_desenho = 440;
  
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(ctx, 4.0);
  [self drawTabuleiro:ctx];
  
  
  CGContextSetRGBStrokeColor(ctx, 0.0, 0.0, 1.0, 1); 
  
  while (x_desenho < x_atual) {
    CGContextBeginPath(ctx);
    x_desenho +=10;
    CGContextMoveToPoint(ctx, x_desenho, y_desenho);
    x_desenho +=10;
    CGContextAddLineToPoint( ctx, x_desenho, y_desenho);
    CGContextStrokePath(ctx);
  }
  
  x_atual+=40;
  
  
}

-(void) start_animation {
  
  x_atual = 20;
  y_atual = 440;
  [NSTimer scheduledTimerWithTimeInterval:.225
                                   target:self 
                                 selector:@selector(new_path)
                                 userInfo:nil 
                                  repeats:YES];
}

-(void) new_path {
  
  [self setNeedsDisplay];
}

@end
