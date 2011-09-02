//
//  LocalizeHelper.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocalizeHelper.h"

@implementation LocalizeHelper

+(NSString *) get_local_language {
  
  return pt_BR;
}

+(NSString *) get_seconds_string {
  
  NSString *local_language = [LocalizeHelper get_local_language];
  if ([local_language isEqualToString:pt_BR]) {
    return @"segs";
  }
  else {
    return @"secs";
  }
}

+(NSString *) convert_value_to_minutes : (float)value {
  
  int valor = value;
  int mins = valor / 60;
  int segs = valor % 60;
  
  NSString *string_segs = @"";
  NSString *string_valor = @"";
  NSString *unidade_medida = @"mins";
  
  if (segs < 10) {
    string_segs = [NSString stringWithFormat:@"0%d",segs];
  }
  else {
    string_segs = [NSString stringWithFormat:@"%d",segs];
  }
  
  
  if (mins < 1) {
    unidade_medida = [LocalizeHelper get_seconds_string];
    string_valor = [NSString stringWithFormat:@"%@",string_segs];
  }
  else {
    string_valor = [NSString stringWithFormat:@"0%d:%@",mins,string_segs];
  }
  
  return [NSString stringWithFormat:@"%@ %@",string_valor, unidade_medida];
  
}

@end
