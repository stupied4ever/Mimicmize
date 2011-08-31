//
//  NSMutableArray+Helper.m
//  Mimicmize
//
//  Created by Vitor Navarro on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//A função de shuffle implementa o algoritmo moderno de Fisher and Yates http://en.wikipedia.org/wiki/Knuth_shuffle#The_modern_algorithm

#import "NSMutableArray+Helper.h"

@implementation NSMutableArray (NSMutableArray_Helper)

-(void)shuffle{
  NSInteger j = 0;
  for (int i = [self count]-1; i>0; i--) {
    j = arc4random() % i;
    [self exchangeObjectAtIndex:j withObjectAtIndex:i];
  }
}


@end
