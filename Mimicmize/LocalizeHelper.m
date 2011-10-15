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
  
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
  NSString *currentLanguage = [languages objectAtIndex:0];
  
  if ([currentLanguage isEqualToString:@"pt"]) {
    return pt_BR;
  }
  return en_US;
}

+(NSString *) get_text_to_group_box_with_index : (NSInteger) index {
  
  NSString *locale = [LocalizeHelper get_local_language];
  BOOL is_pt_br = [locale isEqualToString:pt_BR];
  
  if (index == 1) {
    if (is_pt_br) {
      return @"Nome do seu grupo";
    }
    else {
      return @"Name of your group";
    }
    
  }
  else {
    
    if (is_pt_br) {
      return @"Nome do grupo adversário";
    }
    else {
      return @"Oppnent`s group name";
    }
  }
  
  return @"";
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
  
  valor /=5;
  valor *= 5;
  
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
